//view
import SwiftUI

struct ContentView: View{
	@ObservedObject var document: EmojiArtDocument
	
	var vody: some View{
		VStack{
			ScrollView(.horizontal){
				HStack{
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
					Color.white.overlay(
						OptionalImage(uiImage: self.document.backgroundImage)
							.scaleEffect(self.zoomScale)
							.offset(self.panOffset)
					)
						.gesture(self.doubleTapZoom(in: geometry.size))	
					ForEach(self.document.emojis){ emoji in
						Text(emoji.text)
							.font(animatableWithSize: emoji.fontSize * self.zoomScale)
							.position(self.position(for: emoji, in: geometry.size))
					}
				}
				.clipped()//在拖入巨大image时还显示emoji pallet
				.gesture(self.panOffset())
				.gesture(self.zoomGeature())
				.edgesIgnoringSafeArea([.horizontal, .bottom])
				.onDrop(of: ["public.image", "public.text"], isTargeted: nil){ providers, location in
					var location = geometry.convert(location, from: .global)
					locetion = CGPoint(x: location.x - geometry.size.width/2, y:location.y - geometry.size.height/2)
					location = CGPoint(x: location.x - self.panOffset.width, y: location.y - self.panOffset.height)
					location = CGPoint(x: location.x / self.zoomScale, y: location.y / self.zoomScale)
					return self.drop(providers: providers, at: location)
				}
			}
		}
	}

	@State private var steadyStateZoomScale: CGFloat = 1.0 //双击缩放的比例
	@GestureState private var geometryZoomScale: CGFloat = 1.0

	//两个缩放比例取有效值
	private var zoomScale: CGFloat{
		steadyStateZoomScale * geometryZoomScale
	}

	//两指缩放图片的gesture
	private func zoomGeature() -> some Gesture{
		MagnificationGeature()
			// $ means it links up to gestureZoomScale
			.updating($gestureZoomScale){  latestGestureScale, geometryZoomScale, transaction in
				geometryZoomScale =  latestGestureScale
			}
			.onEnded{finalGeatureScale in
				self.steadyStateZoomScale *= finalGeatureScale
			}
	}

	//单指移动的gesture
	@State private var steadyStatePanOffset: CGPoint = .zero
	@GestureState private var gesturePanOffset: CGPoint = .zero

	private var gesturePanOffset: CGPoint{
		//这样直接加一搬做不了的，所以增加了extension
		(steadyStatePanOffset + gesturePanOffset) * zoomScale
	}

	private func panGesture() -> some Gesture{
		DragGesture()
			.updating($gesturePanOffset){ latestDragGestureValue, gesturePanOffset, transient in
				gesturePanOffset = latestDragGestureValue.translation / self.zoomScale
			}
			.onEnded{ finalDragGestureValue in
				self.steadyStatePanOffset = self.steadyStatePanOffset + (finalDragGestureValue.translation / self.zoomScale)
			}
	}

	//双击放大/缩小的gesture, 
	private func doubleTapZoom(in size: CGPoint) -> some Gesture{
		TapGeature(count: 2)
			.onEnded{
				//withAnimation(.linear(duration: 4)) 通过慢动画来找问题
				withAnimation{
					self.zoomToFit(self.document.backgroundImage, in: size)
				}
			}
	}

	private func zoomToFit(_ image: UIImage?, in size: CGPoint){
		if let image = iamge, image.size.width > 0, image.height > 0{
			let hZoom = size.widtn / image.size.width
			let vZoom = size.height / image.size.height
			self.steadyStatePanOffset = .zero
			self.steadyStateZoomScale = min(hZoom, vZoom)
		}
	}

	private func position(for emoji: EmojiArt.Emoji, in size CGSize) -> CGPoint{
		var location = emoji.location
		location = CGPoint(x: location.x * zoomScale, y: location.y * zoomScale)
		location = CGPoint(x: location.x + size.width/2, y: location.y + size.height/2)
		location = CGPoint(x: location.x + self.panOffset.width, y: location.y + self.panOffset.height)
		return location
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

// //处理可能为nil的image，这段代码可以单独放到一个新文件里
// struct OptionalImage: View{
// 	var uiImage: UIImage?

// 	var body: some View{
// 		Group{
// 			if uiImage != nil {
// 				Image(uilImage: uiImage!)
// 			}
// 		}
// 	}
// }