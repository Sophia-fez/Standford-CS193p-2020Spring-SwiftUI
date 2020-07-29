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
		cards.shuffle() //洗牌
	}

	struct Card: Identifiable{
		var isFaceUp: Bool = false{
			didset{
				if isFaceUp{
					startUsingBonusTime()
				}else{
					stopUsingBonusTime
				}
			}
		}
		var isMatched: Booll = false{
			didset{
				stopUsingBonusTime()
			}
		}
		var content: CardContent
		var id: Int







		//直接提供的代码
		// MARK: - Bouns Tims

		// this could give matcing bonus points
		// if the user matches the card
		// before a certain amount of time passes during which the card is face up

		//can be zero which means "no bonus available" for this card
		var bonusTimeLimit: TimeInterval = 6

		//how long this card has ever been face up
		private var faceUpTime: TimeInterval{
			if let lastFaceUpDate = self.lastFaceUpDate{
				return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
			}else{
				return pastFaceUpTime
			}
		}

		// the last time this card was turned face up(and is still face up)
		var lastFaceUpDate: Date?
		// the accumulated time this card has been face up in past
		// (i.e not including the current time it's been face up if it is currently so)
		var pastFaceUpTime: TimeInterval = 0

		// how much time left befor the bonus opportunity runs out
		var bonusTimeRemaining: TimeInterval{
			max(0, bonusTimeLimit - faceUpTime)
		}
		// percentage of the bonus time remaining
		var bonusRemaining: Double{
			(bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
		}
		// whether the card was matched during the bonus time period
		var hasEarnedBonus: Bool{
			isMatched && bonusTimeRemaining > 0
		}
		// whether we are currently face up, unmatched and have not yet used up the bonus window
		var isConsumingBonusTime: Bool{
			isFaceUp && !isMatched && bonusTimeRemaining > 0
		}

		// called when the card transitions to face up state
		private mutating func startUsingBonusTime(){
			if isConsumingBonusTime, lastFaceUpDate == nil{
				lastFaceUpDate = Date
			}
		}

		// called when the card goes back face down (or gets matched)
		private mutating func stopUsingBonusTime(){
			pastFaceUpTime = faceUpTime
			self.lastFaceUpDate = nil
		}
	}
}


