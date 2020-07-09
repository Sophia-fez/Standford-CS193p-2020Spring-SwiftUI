//view
import SwiftUI

struct PaletteChooser: View{
	@ObservedObject var document: EmojiArtDocument

	@Binding private var chosenPalette: String
	@State private var showPaletteEditor = false

	var body: some View{
		HStack{
			Stepper(onIncrement: {
				self.chosenPalette = self.document.Palette(after: self.chosenPalette)
			}, onDecrement: {
				self.chosenPalette = self.document.Palette(before: self.chosenPalette)
			}, label: {EmptyView()})
			Text(self.document.paletteNames[self.chosenPalette] ?? "")
			Image（systemName: "keyboard".imageScale(.large)
				.onTapGesture{
					self.showPaletteEditor = true
				}
				.popover(isPresented: $showPaletteEditor){
					PaletteEditor(chosenPalette: self.$chosenPalette, isShowing:self.$showPaletteEditor)
						.environmentObject(self.document)
						.frame(minWidth: 300, minHeight: 500)  //PaletteEditor小弹窗的大小
				}
		}
		.fixedSize(horizontal: true, vertical: false)
	}
}

struct PaletteEditor: View{
	@EnvironmentObject var document: EmojiArtDocument  //获取到document

	@Binding var chosenPalette: String
	@Binding var isShowing: Bool
	@State private var paletteName: String = ""
	@State private var emojisToAdd: String = ""

	var body: some View{
		VStack(Spacing: 0){
			ZStack{
				Text("Palette Editor").font(.headline).padding()
				HStack{
					Spacer()
					Button(action: { //Done按钮按完应该要关闭这个Sheet弹窗
						self.isShowing = false
					}, label: {Text("Done")}).padding()
				}
			}
			Divider()  //一条横线
			Form{
				Section{
					//编辑&保存paletteName
					TextField("Palette Name", text: $paletteName, onEditingChange:{began in
						if !began{
							self.document.renamePalette(self.chosenPalette, to: self.paletteName)
						}
					})
					TextField("Add Emoji", text: $emojisToAdd, onEditingChange:{began in
						if !began{
							self.chosenPalette = self.document.addEmoji(self.emojisToAdd, toPalette: self.chosenPalette)
							self.emojisToAdd = ""
						}
					})
				]
				Section(header: Text("Remove Emoji")){
					Grid(chosenPalette.map{String($0)}, id: \.self) {emoji in
						Text(emoji).font(Font.system(size: self.fontSize))
							.onTapGeature{
								self.chosenPalette = self.document.removeEmoji(emoji, fromPalette: self.chosenPalette)
							}
					}
					.frame(height: self.height)
				}
			}
		}
		//初始化编辑框的内容为当前paletteName
		.onAppear{self.paletteName = self.document.paletteNames[self.chosenPalette] ?? ""}
	}

	//MARK: - Drawing Constants

	var height: CGFloat{ //给出网格高度，让emoji在网格里显示
		CGFloat((chosenPalette.count - 1) / 6) *70 + 70
	}
	let fontSize: CGFloat = 40  //emoji变大一点
}


struct PaletteChooser_Previews: PreviewProvider{
	static var previews: some View{
		PaletteChooser(document: EmojiArtDocument(), chosenPalette: Binding.constant(""))
	}
}



// //引入grid之前的版本
// 	Section(header: Text("Remove Emoji")){
// 		VStack{
// 			ForEach(chosenPalette.map{String($0)}, id: \.self) {emoji in
// 				Text(emoji)
// 					.onTapGeature{
// 						self.chosenPalette = self.document.removeEmoji(emoji, fromPalette: self.chosenPalette)
// 					}
// 			}
// 		}
// 	}