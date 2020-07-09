//viewModel
import SwiftUI
import Combine

class EmojiArtDocument: ObservableObject, Hashable, Identifiable{
	static func == (lhs: EmojiArtDocument, rhs: EmojiArtDocument) -> Bool{
		lhs.id == rhs.id
	}

	let id: UUID

	let if = UUID()
	
	func hash(into hasher: inout Hasher){
		hasher.combine(id)
	}

	static let palette: String = "ABCDEF"

	@Published private var emojiArt: EmojiArt 

	private var autosaveCancellable: AnyCancellable?

	init(id: UUID? =nil){
		self.id = id ?? UUID
		let defaultsKey = "EmojiArtDocument.\(self.id。uuidString)"  //以id作为文件默认命名
		emojiArt = emojiArt(json: UserDefault.standard.data(forKey: defaultsKey)) ?? EmojiArt()
		autosaveCancellable = $emojiArt.sink { emojiArt in
			//print("/(emojiArt.json?.utf8 ?? "nil")")
			UserDefault.standard.set(emojiArt.json, forKey: defaultsKey)
		}
		fetchBackgroundImageData() 
	}

	@Published private(set) var backgroundImage: UIImage?

	@Published var steadyStateZoomScale: CGFloat = 1.0 //双击缩放的比例
	@Published var steadyStatePanOffset: CGPoint = .zero

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

	var backgroundURL: URL?{ //加载新image前不显示emoji
		get{
			emojiArt.backgroundURL
		}
		set{
			emojiArt.backgroundURL = url?.imageURL
			fetchBackgroundImageData()
		}
	}

	private var fetchImageCancellable: AnyCancellable?

	private func fetchBackgroundImageData(){
		backgroundImage = nil
		if let url = self.emojiArt.backgroundURL{
			fetchImageCancellable?.cancel()
			fetchImageCancellable = URLSession.shared.dataTaskPublisher(for: url)
				.map{data, urlResponse in UIImage(data: data)}
				.receive(on: DispatchQueue.main)
				.replaceError(with: nil)
				.assign(to: \.backgroundImage, on: self)
		}
	}

}


extension EmojiArt.Emoji{
	var fontSize: CGFloat(CGFloat(self.size))
	var location: CGPoint(CGPoint(x: CGFloat(x), y: CGFloat(y)))
}

// //调整前
// 	private func fetchBackgroundImageData(){
// 		backgroundImage = nil
// 		if let url = self.emojiArt.backgroundURL{
// 			fetchImageCancellable?.cancel()
// 			let session = URLSession.shared
// 			let publisher = session.dataTaskPublisher(for: url)
// 				.map{data, urlResponse in UIImage(data: data)}
// 				.receive(on: DispatchQueue.main)
// 				.replaceError(with: nil)
// 			//publisher.assign(to: \EmojiArtDocument.backgroundImage, on: self)
// 			fetchImageCancellable = publisher.assign(to: \.backgroundImage, on: self)
// 		}
// 	}