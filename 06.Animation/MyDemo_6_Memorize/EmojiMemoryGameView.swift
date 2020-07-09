//view
import SwiftUI

struct ContenView: View{
	@ObervedObject var viewModel: EmojiMemoryGame

	var body: some View{
		VStack{
			Grid(viewModel.cards){ card in
				CardView(card: card).onTapGesture{
					//Explicit animation
					withAnimation(.liner(duration: 0.75)){
						self.viewModel.choose(card: card)
					}
				}
				.padding(5)
			}
				.padding()
				.foregroundColor(Color.orange)
			//New Game按钮
			Button(action: {
				//Explicit animation 洗牌动画，朝上的卡片会慢慢变成背面，有一个过渡
				//withAnimation(Animation.easeInOut(duration: 2)), Animation可省略，时长设为2s便于观察效果
				withAnimation(.easeInOut){ //使用default duration
					self.viewModel.resetGame()
				}
			}, label: {Text("New Game") })
		}
	}
}

struct CardView: View{
	var card: MemoryGame<String>.Card

	var body: some View{
		GeometryReader{ geometry in
			self.body(for: geometry.size)
		}
	}


	//和model同步
	@State private var animateBonusREmaining: Double = 0

	private func starBonusTimeAnimation(){
		animatedBonusRemaining = card.bonusRemaining
		withAnimation(.linear(duration: card.bonusTimeRemaining){
			animatedBonusRemaining = 0
		}
	}

	@ViewBuilder
	private func body(for size: CGSize) -> some View{
		if card.isFaceUp || !card.isMatched{
			ZStack{
				Group{
					if card.isConsumingBonusTime{
						//Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-card.bonusRemaining*360-90), clockwise: true)直接这样的pie还是不能动画但却是可以计时变化了
						Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-animateBonusREmaining*360-90), clockwise: true)
							.onAppear{
								self.starBonusTimeAnimation()
							}
					}else{ //matched的时候，不需要计时了但是还是要pie的，但不需要动画
						Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-card.bonusRemaining*360-90), clockwise: true)
					}
				}
				.padding(5).opacity(0.4)
				.transition(.identity) //匹配时emoji旋转
				//.transition(.scale) //pie放大出现

				Text(card.content)
					.font(Font.system(size: fontSize(for: size))
					//implicit animation, 仅在卡片匹配时，持续1s的动画并一直重复动画
					.rotationEffect(Angle.degrees(card.isMatched ? 180 : 0) //180度到0度的旋转
					.animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default) 
			}
			.cardify(isFaceUp: card.isFaceUp)
			.transition(AnyTransition.scale) //卡片缩放消失/出现的动画, new game的时候会慢慢放大出现，匹配的时候会慢慢缩小消失
			//封装到 Modify 里 Cardify.swift
			//.rotation3DEffect(Angle.degrees(card.isFaceUp ? 0 : 180), axis: (0,1,0)) //绕y轴旋转
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
// //使用Group合并前
// 			ZStack{
// 				if card.isConsumingBonusTime{
// 					//Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-card.bonusRemaining*360-90), clockwise: true)直接这样的pie还是不能动画但却是可以计时变化了
// 					Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-animateBonusREmaining*360-90), clockwise: true)
// 						.padding(5).opacity(0.4)
// 						.onAppear{
// 							self.starBonusTimeAnimation()
// 						}
// 				}else{ //matched的时候，不需要计时了但是还是要pie的，但不需要动画
// 					Pie(startAngle: Angle.degress(0-90), endAngle: Angle.degress(-card.bonusRemaining*360-90), clockwise: true)
// 						.padding(5).opacity(0.4)
// 				}

// 				Text(card.content)
// 					.font(Font.system(size: fontSize(for: size))
// 					.rotationEffect(Angle.degrees(card.isMatched ? 180 : 0) //180度到0度的旋转
// 					//implicit animation, 仅在卡片匹配时，持续1s的动画并一直重复动画
// 					.animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default) 
// 			}
