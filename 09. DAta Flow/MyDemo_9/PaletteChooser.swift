//view
import SwiftUI

struct PaletteChooser: View{
	@ObservedObject var document: EmojiArtDocument

	//不需要初始化，因为Binding意味着会在其他地方初始化
	@Binding private var chosenPalette: String

	var body: some View{
		HStack{
			Stepper(onIncrement: {
				self.chosenPalette = self.document.Palette(after: self.chosenPalette)
			}, onDecrement: {
				self.chosenPalette = self.document.Palette(before: self.chosenPalette)
			}, label: {EmptyView()})
			Text(self.document.paletteNames[self.chosenPalette] ?? "")
		}
		.fixedSize(horizontal: true, vertical: false) //适应本身的大小而不用多余的空间
		//因为Binding了，所以不需要在这里再onAppear了
		//.onAppear{self.chosenPalette = self.document.defaultPalette} //设置初始就显示paletteName
	}
}

struct PaletteChooser_Previews: PreviewProvider{
	static var previews: some View{
		PaletteChooser(document: EmojiArtDocument(), chosenPalette: Binding.constant(""))
	}
}