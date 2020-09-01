# lecture_9 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- Let’s give better feedback when we’re off loading our background image from the internet @Published’s publisher to autosave 
- .onReceive to automatically zoom to ﬁt when our backgroundImage changes
- URLSession publisher to load image
- Add a Palette Chooser (@Binding)

## view模块
- **EmojiArtDocumentView.swift**
    + 在等待时间添加一直spinning的icon
    + image调整到合适的大小再显示
    + 加入PaletteChooser这个view
    + 设置初始就显示paletteName对应的emoji
    + 通过 `$chosenPalette` 绑定 PaletteChooser.swift 里的 `@Binding` 对应的 var,达到点击加减号PaletteName和对应eomiji都切换的效果

- **新增PaletteChooser.swift**
    + 封装了PaletteChooser这个view
    + `.fixedSize()` 去掉多余空间
    + `.onAppear{}` 设置初始就显示paletteName
    + 通过 `@Binding` 绑定

- **新增Spinning.swift**
    + 封装一直spinning的icon功能

- **OptionalImage.swift**

- **AnimatableSystemFontModifier.swift**

## model模块
- **EmojiArt.swift**

- **导入EmojiArtDocumentPalette.swift**
    + 给出了一些default palette
    + 从palette添加或者删除emoji
    + 获取这个palette前一个或者后一个palette

## extension
- **EmojiArtExtensions.swift**

## viewModel模块
- **EmojiArtDocument.swift**
    + 用 `@Punlished` 实现image加载好再显示
    + `private func fetchBackgroundImageData(){}` 也改成了published 的版本

## 最终效果
<img src="./MyDemo_9效果图.png">

## MyTips
- 几个Published写法怎么回事要再研究一下
- EmojiArtDocumentView.swift和PaletteChooser.swift之间的Binding