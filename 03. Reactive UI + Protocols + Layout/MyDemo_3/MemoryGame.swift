//model
import Foundation

struct MemoryGame<CardContent>{ //宣告CardContent是通用类型
	var cards: Array<Card>

	//所有修改自己的func都要加上mutating
	//内外部名称一样，用 _ 替代，这里也可以不写 _
	mutating func choose(_ card: Card){
		print("card chosen: \(card)")
		let chosenIndex: Int = self.index(of: card)
		self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
	}

	//根据id找到点击的card的index，不修改所以不需要加mutating
	//of card就是外部和内部名称
	func index(of card: Card) -> Int{
		for index in 0..<self.cards.count{
			if self.cards[index].id == card.id{
				return index
			}
		}
		//如果找不到这个card其实返回0是不对的，这个之后再解决
		return 0 // TODO: bogus!
	}

	//init功能室创建，没有歧义一定是mutating的所以反而不需要加mutating
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