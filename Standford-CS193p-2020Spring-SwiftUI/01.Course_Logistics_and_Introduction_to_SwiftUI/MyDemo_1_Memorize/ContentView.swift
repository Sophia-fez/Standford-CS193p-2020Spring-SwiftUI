import SwiftUI

struct ContenView: View{
	var body: some View{	//view必须有body
		//ZStack填充ForEach，ForEach组成HStack
		HStack{		//HStack水平排列，不加HStack的话会显示出四个页面来
			ForEach(0..<4){	//四个卡片，0...4包括4，0..<4是0-3
				CardView(isFaceUp: false)	//初始值false，不初始化会报错
			}
		}
			.padding()	//卡片之间的间距，不设置是为了保持为标准间剧
			.foregroundColor(Color.orange)	//属性可以被覆盖
			.font(Font.largeTitle)
	}
}

struct CardView: View{
	var isFaceUp: Bool

	var body: some View{
		ZStack{		//本质上是一张卡片
			if isFaceUp{
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text("X")
			}else{
				//会自动匹配上面的foregroundColor(Color.orange)
				RoundedRectangle(cornerRadius: 10.0).fill() 
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider{
	static var previews: some View{
		ContentView()
	}
}

//----------------------------

// //闭包/内联函数的糖
// import SwiftUI

// struct ContenView: View{
// 	var body: some View{
// 		return HStack(content: {	//return可以省略，只有一个参数也可以省略掉
// 			ForEach(0..<4, content: {		//两个参数可以省略一个
// 				CardView(isFaceUp: false)
// 			})
// 		})
// 			.padding()
// 			.foregroundColor(Color.orange)
// 			.font(Font.largeTitle)
// 	}
// }

// struct CardView: View{
// 	var isFaceUp: Bool

// 	var body: some View{
// 		ZStack() {		//同理省略,甚至()都不需要
// 			if isFaceUp{
// 				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
// 				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
// 				Text("X")
// 			}else{
// 				RoundedRectangle(cornerRadius: 10.0).fill() 
// 			}
// 		}
// 	}
// }

// struct ContentView_Previews: PreviewProvider{
// 	static var previews: some View{
// 		ContentView()
// 	}
// }