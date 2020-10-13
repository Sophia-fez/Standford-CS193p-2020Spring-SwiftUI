# lecture_7 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- Review MVVM
- ScrollView 
- fileprivate 
- Drag and Drop
- UIImage 
- Multithreading

## view模块
- **新建EmojiArtDocumentView.swift**
    - emoji palette
    - 画布
    - 对image和emoji实现drag & drop
    - drop后绘制UI，显示出来

## model模块
- **新建EmojiArt.swift**
    - `struct Emoji: Identifiable{}`, 通过 `fileprivate init()` 实现只有该文件可以创建修改emoji

## extension
- **导入EmojiArtExtensions.swift**
    - `func firstIndex(){}`, `func contains(){}`
    - `imageURL{}`
    - 异步程序的同步问题
    - `GeomotryProxy{}` convert from coordinate space

## viewModel模块
- **新建EmojiArtDocument.swift**
    - `func addEmoji(){}`
    - `func moveEmoji(){}`
    - `func scaleEmoji(){}`
    - `private func fetchBackgroundImageData(){}` image 的 drag & drop，多线程，异步

## 创建项目时已有的文档
- **SceneDelegate.swift**
    - `let contentView = EmojiArtDocumentView(document: EmojiArtDocument())`

## 最终效果
<img src="./MyDemo_7效果图.png">

## MyTips
这期涉及的东西有点多，没有都搞懂，需要进一步研究
