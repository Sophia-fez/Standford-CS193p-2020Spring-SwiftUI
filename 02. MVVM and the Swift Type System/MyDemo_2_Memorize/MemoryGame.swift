//model
import Foundation

struct MemoryGame<CardContent>{ //宣告CardContent是通用类型
	var cards: Array<Card>

	func choose(card: Card){
		print("card chosen: \(card)")
	}

	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
		cards = Array<Card>()  //创建一个卡片
		for pairIndex in 0...<numberOfPairsOfCards{
			//model知道content具体是什么，用函数cardContentFactory获取content
			//content不是变量所以改用常量，swift自动识别type，所以不需要写成let content： CardContent =
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex*2))
			cards.append(Card(content: content, idL pairIndex*2+1))
		}
	}

	struct Card: Identifiable{
		var isFaceUp: Bool = false
		var isMatched: Booll = false
		var content: CardContent  //不在意卡片上到底有什么，string、image都可以
		var id: Int
	}
}


// //不需要identifier版的代码
// import Foundation

// struct MemoryGame<CardContent>{ //宣告CardContent是通用类型
// 	var cards: Array<Card>

// 	func choose(card: Card){
// 		print("card chosen: \(card)")
// 	}

// 	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
// 		cards = Array<Card>()  //创建一个卡片
// 		for pairIndex in 0...<numberOfPairsOfCards{
// 			//model知道content具体是什么，用函数cardContentFactory获取content
// 			//content不是变量所以改用常量，swift自动识别type，所以不需要写成let content： CardContent =
// 			let content = cardContentFactory(pairIndex)
// 			cards.append(Card(isFaceUp: false, isMatched: false, content: content))
// 			cards.append(Card(isFaceUp: false, isMatched: false, content: content))
// 		}
// 	}

// 	struct Card{
// 		var isFaceUp: Bool
// 		var isMatched: Bool
// 		var content: CardContent  //不在意卡片上到底有什么，string、image都可以
// 	}
// }