//view
import SwiftUI

struct ContenView: View{
	//加上@ObervedObject后，每次观察对象更新了就会重新绘制UI
	@ObervedObject var viewModel: EmojiMemoryGame

	var body: some View{
		Grid(viewModel.cards){ card in
			CardView(card: card).onTapGesture{
				self.viewModel.choose(card: card)
			}
			.padding(5) //增加卡片之间的空隙
		}
			.padding()
			.foregroundColor(Color.orange)
	}
}

struct CardView: View{
	var card: MemoryGame<String>.Card

	var body: some View{
		GeometryReader{ geometry in
			self.body(for: geometry.size)
		}
	}

	func body(for size: CGSize) -> some View{
		ZStack{
			if card.isFaceUp{
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			}else{
				//swiftUI里的empty view，如果卡片匹配就将它们从屏幕上清楚
				if !card.isMatched{
					RoundedRectangle(cornerRadius: cornerRadius).fill() 
				}
			}
			.font(Font.system(size: fontSize(for: size))
		}
	}

	//MARK: - Drawing Constants

	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3
	func fontSize(for size: CGSize) -> CGFloat{
		min(size.width, size.height) * 0.75)
	}
}


struct ContentView_Previews: PreviewProvider{
	static var previews: some View{
		ContentView(viewMedel: EmojiMemoryGame())
	}
}

//----------------------------

// //闭包的糖
// struct ContenView: View{
// 	//加上@ObervedObject后，每次观察对象更新了就会重新绘制UI
// 	@ObervedObject var viewModel: EmojiMemoryGame

// 	var body: some View{
// 		// viewForItem:是最后一个argument所以可以省略
// 		// items:也可以不需要，需要在Grid.swift里写init
// 		Grid(items: viewModel.cards, viewForItem: { card in
// 			CardView(card: card).onTapGesture{
// 				self.viewModel.choose(card: card)
// 			}
// 		})
// 			.padding()
// 			.foregroundColor(Color.orange)
// 	}
// }