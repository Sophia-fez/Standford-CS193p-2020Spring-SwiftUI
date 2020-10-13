# lecture_8 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- JSON/Codable
- UserDefaults  OptionalImage  Animatable Font Size
- Gesture

## view模块
- **EmojiArtDocumentView.swift**
    + 双击缩放image的gesture  
    + 两指缩放image的gesture  
    + 单指移动image的gesture

- **新建OptionalImage.swift**
    + 将显示image的功能封装出来  

- **导入AnimatableSystemFontModifier.swift**
    + make animatable data: font size，解决缩放时候emoji卡住的问题  

## model模块
- **EmojiArt.swift**
    + Codable  
    + `init(json: Data?){}` 进行 Decode  

## extension
- **EmojiArtExtensions.swift**

## viewModel模块
- **EmojiArtDocument.swift**
    + 将每一次的编辑存为json文件，及时更新model  
    + `init(){}` 打开app是如果有上一次保存的文件则打开没有的话打开空白画布  


## 最终效果
<img src="./MyDemo_8效果图.png">

## MyTips
- EmojiArtDocumentView.swift需要再研究一下，如何实现双击缩放、两指缩放、单指移动image同时起作用的