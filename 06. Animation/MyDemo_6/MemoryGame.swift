//model
import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
	private(set) var cards: Array<Card>

	private var indexOfTheOneAndOnlyFaceUpCard: Int?{ //可以在这里初始化为nil但是不这么做
		get{cards.indices.filter{in cards.[$0].isFaceUp}.only}
		set{
			for index in cards.indices{
				cards.[index].isFaceUp = index == newValue
			}
		}
	}

	mutating func choose(_ card: Card){
		if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
			if let potentialMtachIndex = indexOfTheOneAndOnlyFaceUpCard{
				if cards[chosenIndex].content == cards[potentialMtachIndex].content{
					cards[chosenIndex].isMatched = true
					cards[potentialMtachIndex].isMatched = true
					self.cards[chosenIndex].isFaceUp = true //choose的那张朝上
				}
			}else{
				indexOfTheOneAndOnlyFaceUpCard = chosenIndex
			}
		}
	}

	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
		cards = Array<Card>()  //创建一个卡片
		for pairIndex in 0...<numberOfPairsOfCards{
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex*2))
			cards.append(Card(content: content, idL pairIndex*2+1))
		}
	}

	struct Card: Identifiable{
		var isFaceUp: Bool = false
		var isMatched: Booll = false
		var content: CardContent
		var id: Int
	}
}