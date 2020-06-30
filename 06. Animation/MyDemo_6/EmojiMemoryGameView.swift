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

	@ViewBuilder
	private func body(for size: CGSize) -> some View{
		if card.isFaceUp || !card.isMatched{
			ZStack{
				Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(110-90), clockwise: true)
				Text(card.content)
					.font(Font.system(size: fontSize(for: size))
			}
			//.modifier(Cardify(isFaceUp: card.isFaceUp)
			.cardify(isFaceUp: card.isFaceUp)
		}
	}

	//MARK: - Drawing Constants

	private func fontSize(for size: CGSize) -> CGFloat{
		min(size.width, size.height) * 0.7)
	}
}

//返回resume显示的视图，修改为让第一张card被选中
struct ContentView_Previews: PreviewProvider{
	static var previews: some View{
		let game = EmojiMemoryGame()
		game.choose(card: game.cards[0])
		ContentView(viewMedel: game)
	}
}

//---------------------------

// //修改前的
// struct ContentView_Previews: PreviewProvider{
// 	static var previews: some View{
// 		ContentView(viewMedel: EmojiMemoryGame())
// 	}
// }

//---------------------------

// // //写animation前的
// 	private func body(for size: CGSize) -> some View{
// 		ZStack{
// 			if card.isFaceUp{
// 				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
// 				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
// 				//Circle().padding(5).opacity(0.4) //边框距离和透明度，写shape之前这么写的
// 				Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(110-90), clockwise: true)
// 				Text(card.content)
// 			}else{
// 				if !card.isMatched{
// 					RoundedRectangle(cornerRadius: cornerRadius).fill() 
// 				}
// 			}
// 			.font(Font.system(size: fontSize(for: size))
// 		}
// 	}

//---------------------------

// //写extension前
// 	private func body(for size: CGSize) -> some View{
// 		ZStack{
// 			Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(110-90), clockwise: true)
// 			Text(card.content)
// 				.font(Font.system(size: fontSize(for: size))
// 		}
// 		.modifier(Cardify(isFaceUp: card.isFaceUp)
// 		//.cardify(isFaceUp: card.isFaceUp)
// 	}