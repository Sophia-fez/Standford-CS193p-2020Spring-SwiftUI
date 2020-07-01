//viewModifier
import SwiftUI

struct Cardify: AnimatableModifier{
//或者struct Cardify: ViewModifier, Animatable{
	var rotation: Double

	init(isFaceUp: Bool){
		rotation = isFaceUp ? 0 : 180
	}

	var isFaceUp: Bool{
		rotation < 90
	}

	//将rotation重命名为animatableData
	var animatableData: Double{
		get{return rotation}
		set{rotation = newValue}
	}

	func body(content: Content) -> some View{
		ZStack{
			Group{
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				content
			}
				.opacity(isFaceUp ? 1 : 0)
			RoundedRectangle(cornerRadius: cornerRadius).fill() 
				.opacity(isFaceUp ? 0 : 1) //通过设置透明度来隐藏一面，但是始终显示的
		}
		.rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
	}

	private let cornerRadius: CGFloat = 10.0
	private let edgeLineWidth: CGFloat = 3
}

extension View{
	func cardify(isFaceUp: Bool) -> some View{
		self.modifier(Cardify(isFaceUp: isFaceUp))
	}
}