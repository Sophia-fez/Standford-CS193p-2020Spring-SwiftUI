//model
import Foundation

//加上content是Equatable的约束，否则下面func choose里"=="无法使用
struct MemoryGame<CardContent> where CardContent: Equatable{
	var cards: Array<Card>

	//使用computed var实现
	var indexOfTheOneAndOnlyFaceUpCard: Int?{ //可以在这里初始化为nil但是不这么做
		get{cards.indices.filter{in cards.[$0].isFaceUp}.only}
		set{
			for index in cards.indices{
				cards.[index].isFaceUp = index == newValue
			}
		}
	}

	//这里代码要随着get和set的实现改变
	mutating func choose(_ card: Card){
		//if let后面不可以使用&&连接判断条件，使用逗号连接判断条件，当第一个条件满足再挨个往后判断
		if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
			//两张卡片匹配
			if let potentialMtachIndex = indexOfTheOneAndOnlyFaceUpCard{
				if cards[chosenIndex].content == cards[potentialMtachIndex].content{
					cards[chosenIndex].isMatched = true
					cards[potentialMtachIndex].isMatched = true
					self.cards[chosenIndex].isFaceUp = true //choose的那张朝上
				}
			}else{ //除了choose的那张其他的都要朝下
				indexOfTheOneAndOnlyFaceUpCard = chosenIndex
			}
		}
	}

	// //Grid.swift写了extension，这里的func也不需要了
	// func index(of card: Card) -> Int{
	// 	for index in 0..<self.cards.count{
	// 		if self.cards[index].id == card.id{
	// 			return index
	// 		}
	// 	}
	// 	return 0 // TODO: bogus!
	// }

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

//----------------------------

// // 使用option之前的版本
// 	mutating func choose(_ card: Card){
// 		print("card chosen: \(card)")
// 		// let chosenIndex: Int = self.index(of: card)
// 		let chosenIndex: Int = cards.firstIndex(matching: card)
// 		self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
// 	}

//----------------------------

// //未使用computed bar的版本
// 	var indexOfTheOneAndOnlyFaceUpCard: Int? //可以在这里初始化为nil但是不这么做

// 	mutating func choose(_ card: Card){
// 		//if let后面不可以使用&&连接判断条件，使用逗号连接判断条件，当第一个条件满足再挨个往后判断
// 		if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
// 			//两张卡片匹配
// 			if let potentialMtachIndex = indexOfTheOneAndOnlyFaceUpCard{
// 				if cards[chosenIndex].content == cards[potentialMtachIndex].content{
// 					cards[chosenIndex].isMatched = true
// 					cards[potentialMtachIndex].isMatched = true
// 				}
// 				indexOfTheOneAndOnlyFaceUpCard = nil
// 			}else{ //除了choose的那张其他的都要朝下
// 				for index in cards.indices{
// 					cards[index].isFaceUp = false
// 				}
//				//indexOfTheOneAndOnlyFaceUpCard = chosenIndex
// 			}
// 			self.cards[chosenIndex].isFaceUp = true  //choose的那张朝上
// 		}
// 	}

//----------------------------

// //get set精简前的版本
// 	var indexOfTheOneAndOnlyFaceUpCard: Int?{ //可以在这里初始化为nil但是不这么做
// 		get{
// 			//Array<Int>()和[Ine]()都是表示Int类型的数组
// 			//-----这部分都写到一起
// 			var faceUpCardIndices = [Int]() //存所有朝上的卡片
// 			for index in cards.indices{
// 				if cards[index].isFaceUp{
// 					faceUpCardIndices.append[index]
// 				}
// 			}
// 			//-----这部分使用extension实现
// 			if faceUpCardIndices.count == 1{
// 			 	return faceUpCardIndices.first
// 			}else{
// 			 	return nil
// 			}
// 			//-----
// 		}
// 		set{ //set的精简就是把if else改成一个判断句
// 			for index in cards.indices{
// 				if index = newValue{ //当发现newValue时set为true，保证唯一卡片朝上
// 					cards.[index].isFaceUp = true //只有当有一张卡片被选中的时候index才不是nil
// 				}else{
// 					cards.[index].isFaceUp = false
// 				}
// 			}
// 		}
// 	}


// //对get的精简过程
// 		get{
// 			//精简版本1，合并
// 			var faceUpCardIndices = cards.indices.filter{(index) -> Bool in
// 				return cards.[index].isFaceUp
// 			}
// 			//精简版本2，闭包的糖
// 			var faceUpCardIndices = cards.indices.filter{index in cards.[index].isFaceUp}
// 			//精简版本3，$0的用法，要改为let
// 			let faceUpCardIndices = cards.indices.filter{in cards.[$0].isFaceUp}
// 			//对Array extension后
// 			cards.indices.filter{in cards.[$0].isFaceUp}.only
// 		}