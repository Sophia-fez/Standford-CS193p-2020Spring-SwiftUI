//viewmodel
import SwiftUI

class EmojiMemoryGame: ObservableObject{
	//@Published不是keyword，是property wrapper，这样viewmodel就会即时通知view更新
	@Published private var model: MemoryGame<String> = createMemeoryGmae()

	func createMemeoryGmae() -> MemoryGame<String>{
		let emojis = ["A", "B", "C"]
		MemoryGame<String>(numberOfPairsOfCards: emojis.count} {pairIndex in 
			return emojis[pairIndex]
		}
	}

	// MARK: - Access to the Model

	var cards: Array<MemoryGame<String>.Card>{
		model.cards
	}

	// MARK: - Intent(s)

	func choose(card: MemoryGame<String>.Card){
		//objectWillChange.send() //可以这样写来通知view model发生了改变
		model.choos(card: card)
	}
}