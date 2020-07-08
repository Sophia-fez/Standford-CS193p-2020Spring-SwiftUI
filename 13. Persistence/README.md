# lecture_13 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- use UIDocument store EmojiArt documents in the file system.
- That’s a UIKit thing and beyond the scope of this SwiftUI course

## 修改相关功能
- **EmojiArtDocument.swift**
    + `init(url: URL){}`使用`Data(contentsOf: url)`从file system reading & writing document，并自动保存document
    + 更新`func setName()` 要注意name是否已存在、`func addDocument()`使用uniqueName、 `func removeDocument()`
    + uniqueName的extension

- **EmojiArtDocumentStore.swift**
    + `init(directory: URL){}`从file system加载内部数据结构