//viewmodel
import SwiftUI

class EmojiMemoryGame{
	//class需要手动init，所以在struct MemoryGame<CardContent>写了init
	private var model: MemoryGame<String> = createMemeoryGmae()

	static func createMemeoryGmae() -> MemoryGame<String>{
		//let emojis: Array<String> = ["A", "B"]，Array<String>可以省略
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
		model.choos(card: card)
	}
}


// //闭包/内联函数的糖
// //一般不会单独建一个func，而是会写成内联函数
// func createCardContent(pairIndex: Int) -> String{
// 	return "X"
// }

// class EmojiMemoryGame{
// 	//private(set)只有EmojiMemoryGame可以修改
// 	private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)

// 	//内联函数的精简写法1
// 	//Int、-> String、return都不需要，swift可以推断出来
// 	private(set) var model: MemoryGame<String> =
// 		MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {(pairIndex: Int) -> String in
// 			return "X"
// 		})

// 	//内联函数的精简写法2
// 	//因为是最后一个argument，所以还可以删掉cardContentFactory并把{}内的部分放到外面去
// 	//最后还可以用_代替pairIndex
// 	private(set) var model: MemoryGame<String> =
// 		MemoryGame<String>(numberOfPairsOfCards: 2) {pairIndex in "x"}

// 	//内联函数的精简写法3最终版
// 	private var model: MemoryGame<String> = 
// 		MemoryGame<String>(numberOfPairsOfCards: 2} {_ in "X"}

// }