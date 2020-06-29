//view
import SwiftUI

struct ContenView: View{
	var viewModel: EmojiMemoryGame //就是EmojiMemoryGame这个class
	var body: some View{
		HStack{
			ForEach(viewModel.card){ card in	//Array中获取，所以不需要range了
				//onTapGesture(perform: () -> Void)没有参数也没有返回值所以可以省略掉
				//onTapGesture(perform: {viewModel.choose(card: card)})只有一个argument，省略
				CardView(card: card).onTapGesture{
					self.viewModel.choose(card: card) //要加self否则报错
				}
			}
		}
			.padding()
			.foregroundColor(Color.orange)
			.font(Font.largeTitle)
	}
}

struct CardView: View{
	var card: MemoryGame<String>.Card

	var body: some View{
		ZStack{		//本质上是一张卡片
			if card.isFaceUp{
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text(card.content)
			}else{
				//会自动匹配上面的foregroundColor(Color.orange)
				RoundedRectangle(cornerRadius: 10.0).fill() 
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider{
	static var previews: some View{
		ContentView(viewMedel: EmojiMemoryGame())
	}
}