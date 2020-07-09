import SwiftUI

struct Spinning: ViewModifier{
	@State var isVisible = false

	func body(content: Content) -> some View{
		content
			.rotationEffect(Angle(degrees: isVisible ? 360 : 0))
			.animation(Animation.linear(duration: 1)).repeatForever(autoreverses: false)
			.onAppear{ self.isVisible = true }
	}
}

//让loading的icon一直旋转
extension View{
	func spinning() -> some View{
		self.modifier(Spinning())
	}
}