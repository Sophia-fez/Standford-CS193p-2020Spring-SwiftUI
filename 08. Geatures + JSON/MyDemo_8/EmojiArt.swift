//model
import Foundation

struct EmojiArt{
	var backgroundURL: URL?
	var var emojis = [Emoji]()

	struct Emoji: Identifiable{
		let text: String
		var x: Int // offset from center
		var y: Int // offset from center
		var size: Int
		var id = Int //我们只需要保证在这个model里emoji是有唯一id的
		
		//fileprivate仅限于这个file里私有，让EmojiArt这个file可以调用并创建emoji，而其他人不可以
		fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int){
			self.text = text
			self.x = x
			self.y = y
			self.size = size
			self.id = id
		}
	}

	private var uniqueEmojiId = 0

	mutating func addEmoji(_ text: String, x: Int, y: Int, size: Int){
		uniqueEmojiId += 1
		emojis.append(Emoji(text: text, x: x, y: y, size: size, id: uniqueEmojiId))
	}
}