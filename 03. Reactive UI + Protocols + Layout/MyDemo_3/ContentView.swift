//view
import SwiftUI

struct ContenView: View{
	//加上@ObervedObject后，每次观察对象更新了就会重新绘制UI
	@ObervedObject var viewModel: EmojiMemoryGame

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
		//现在不是嵌入geometry的所以不需要self.了
		ZStack{
			if card.isFaceUp{
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			}else{
				RoundedRectangle(cornerRadius: cornerRadius).fill() 
			}
			//因为没有将整个gemetry传给body只传了size所以这里不需要geometry.
			.font(Font.system(size: fontSize(for: size))
		}
	}

	//MARK: - Drawing Constants

	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3
	fuc fontSize(for size: CGSize) -> CGFloat{
		min(size.width, size.height) * 0.75)
	}
}


struct ContentView_Previews: PreviewProvider{
	static var previews: some View{
		ContentView(viewMedel: EmojiMemoryGame())
	}
}



// //代码精简1 闭包
// struct CardView: View{
// 	var card: MemoryGame<String>.Card

// 	var body: some View{
// 		GeometryReader(content: { geometry in  //(content: 可以省略，闭包的糖
// 			ZStack{
// 				if self.card.isFaceUp{
// 					RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
// 					RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
// 					Text(self.card.content)
// 				}else{
// 					RoundedRectangle(cornerRadius: 10.0).fill() 
// 				}
// 				//更好的封装，把字体大小设置放到这里来
// 				.font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
// 				//这些蓝色的数字分散在代码里其实很不好，所以可以建一个控制面板
// 			}
// 		})

// 	}
// }


// //代码精简2 将数字替换掉，并省略self.
// struct CardView: View{
// 	var card: MemoryGame<String>.Card

// 	var body: some View{
// 		GeometryReader{ geometry in
// 			ZStack{
// 				if self.card.isFaceUp{
// 					RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
// 					RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
// 					Text(self.card.content)
// 				}else{
// 					RoundedRectangle(cornerRadius: self.cornerRadius).fill() 
// 				}
// 				//更好的封装，把字体大小设置放到这里来
// 				.font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaleFactor))
// 			}
// 		}
// 	}

// 	//MARK: - Drawing Constants

// 	let cornerRadius: CGFloat = 10.0
// 	let edgeLineWidth: CGFloat = 3
// 	let fontScaleFactor: CGFloat = 0.75
// }