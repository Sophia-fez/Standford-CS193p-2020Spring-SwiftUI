//viewModel
import SwiftUI

class EmojiArtDocument: ObservableObject{
	
	static let palette: String = "ABCDEF"

	//@Published  // workaround for property observer problem with property wraooers
	private var emojiArt: EmojiArt {
		willSet{
			objectWillChange.send()
		}
		didSet{
			//print("json = \(emojiArt.json?.utf8 ?? "nil")")
			UserDefaults.standard.set(emojiArt.json, forKey: EmojiArtDocument.untitled)
		}
	}

	private static let untitled = "EmojiArtDocument.Untitled"

	//如果之前有存就显示之前的，没有的话就创建一个新的空白EmojiArt
	init(){
		emojiArt = emojiArt(json: UserDefaults.standard.data(forKey: EmojiArtDocument.untitled)) ?? EmojiArt()
		fetchBackgroundImageData() 
	}

	@Publiched private(set) var backgroundImage: UIImage?

	var emojis: [EmojiArt.Emoji]{emojiArt.emojis}

	//MARK: - Intent(s)

	func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat){
		emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(long.y), size: Int(size))
	}

	func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize){
		if let index = emojiArt.emojis.firstIndex(matching: emoji){
			emojiArt.emojis[index].x += Int(offset.width)
			emojiArt.emojis[index].y += Int(offset.height)
		}
	}

	func scaleEmoji(_ emoji: EmojiArt.Emoji, by scale: CGFloat){
		if let index = emojiArt.emojis.firstIndex(matching: emoji){
			emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
		}
	}

	func setBackgroundURL(_ url: URL?){
		emojiArt.backgroundURL = url?.imageURL
		fetchBackgroundImageData()
	}

	//多线程异步程序
	private func fetchBackgroundImageData(){
		backgroundImage = nil
		if let url = self.emojiArt.backgroundURL{
			DispatchQueue.global(qos: userInitiated).async{ //放到background thread里
				if let imageData = try? Data(contentsOf: url){ //如果要等到5s也不会影响程序的其他功能
					DispatchQueue.main.asyno{
						if url == self.emojiArt.backgroundURL{
							self.backgroundImage = UIImage(data: imageData) //要回到main thread
						}
					}
				}
			}

		}
	}

}


extension EmojiArt.Emoji{
	var fontSize: CGFloat(CGFloat(self.size))
	var location: CGPoint(CGPoint(x: CGFloat(x), y: CGFloat(y)))
}
