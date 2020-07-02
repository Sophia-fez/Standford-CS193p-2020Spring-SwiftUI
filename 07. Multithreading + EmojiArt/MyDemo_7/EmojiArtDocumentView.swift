//view
import SwiftUI

struct ContentView: View{
	@ObservedObject var document: EmojiArtDocument
	
	var vody: some View{
		VStack{
			ScrollView(.horizontal){
				HStack{
					//the map return an array of String
					//"\"是指key path，"."指this class of things string itself
					ForEach(EmojiArtDocument.palette.map {String($0)}, id: \.self){ emoji in
						Text(emoji)
							.font(Font.system(size: self.defaultEmojiSize))
							.onDrag{ NSItemProvider(object: emoji as NSString)}
					}
				}
			}
			.padding(.horizontal)
			GeometryReader{ geometry in
				ZStack{
					//绘制drop的image
					Color.white.overlay(
						Group{
							if self.document.backgroundImage != nil {
								Image(uilImage: self.document.backgroundImage!)
							}
						}
					)
						.edgesIgnoringSafeArea([.horizontal, .bottom])
						.onDrop(of: ["public.image", "public.text"], isTargeted: nil){ providers, location in
							var location = geometry.convert(location, from: .global)
							locetion = CGPoint(x: location.x - geometry.size.width/2, y:location.y - geometry.size.height/2)
							return self.drop(providers: providers, at: location)
						}
					//绘制drop的emoji
					ForEach(self.document.emojis){ emoji in
						Text(emoji.text)
							.font(self.font(for: emoji))
							.position(self.position(for: emoji, in: geometry.size))
					}
				}
			}
		}
	}

	//viewModel里的extension是为这里服务的
	private func font(for emoji: EmojiArt.Emoji) -> Font{
		Font.system(size: emoji.fontsize)
	}

	private func position(for emoji: EmojiArt.Emoji, in size CGSize) -> CGPoint{
		CGPoint(x: emoji.location.x + size.width/2, y: emoji.location.y + size.height/2)
	}


	//drop
	private func drop(providers: [NSItemProvider], at location: CGPoint) -> Bool {
		var found = providers.loadFirstObject(ofType: URL.self){ url in
			//print("dropped \(url)")
			self.document.setBackgroundURL(url)
		}
		if !found {
			found = providers.loadObjects(ofType: String.self) { string in
				self.document.addEmoji(string, at: location, size: self.defaultEmojiSize)
			}
		}
	}

	private let defaultEmojiSize: CGFloat = 40
}

