# lecture_15 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- alert弹窗

## M model模块
- **EmojiArt.swift**

## V view模块(storyboard)
- **Main.storyboard**

## C controller模块
- **EmojiArtViewController.swift**
    + 这个报错 `'UIDocumentStateChanged' has been renamed to 'UIDocument.stateChangedNotification'`
    ```
    documentObserver = NotificationCenter.default.addObserver(
        forName: Notification.Name.UIDocumentStateChanged,
        object: document,
        queue: OperationQueue.main,
        using: { notification in
            print("documentState changed to \(self.document!.documentState)")
        }
    )
    ```
    这么解决嘛？ `forName: UIDocument.stateChangedNotification,`
    + 这个控制台输出好像也不太对的亚子？？？
    ```
    documentState changed to UIDocumentState(rawValue: 0)
    2020-08-10 18:29:51.446773+0800 EmojiArt[2723:113407] PBItemCollectionServicer connection disconnected.
    documentState changed to UIDocumentState(rawValue: 16)
    documentState changed to UIDocumentState(rawValue: 16)
    documentState changed to UIDocumentState(rawValue: 0)
    2020-08-10 18:30:03.556382+0800 EmojiArt[2723:113235] [UIDocumentLog] document saving on resign active finished: <EmojiArt.EmojiArtDocument: 0x600001988a80> fileURL: file:///Users/sophia_fez/Library/Developer/CoreSimulator/Devices/AF77FE8B-F150-421A-A5B0-E291BE9D039D/data/Containers/Data/Application/52E8A15A-37DC-412A-8BCE-4D65B5A91DD3/Documents/Untitled.json documentState: [Normal]
    ```
    看了一下参考答案的控制台输出
    ```
    documentState changed to .normal
    2020-08-10 18:38:10.525212+0800 EmojiArt[2836:119792] PBItemCollectionServicer connection disconnected.
    documentState changed to .progressAvailable
    documentState changed to .progressAvailable
    documentState changed to .progressAvailable
    documentState changed to .progressAvailable
    documentState changed to .normal
    documentState changed to .normal
    2020-08-10 18:38:18.481862+0800 EmojiArt[2836:119732] [UIDocumentLog] document saving on resign active finished: <EmojiArt.EmojiArtDocument: 0x600002a9f2c0> fileURL: file:///Users/sophia_fez/Library/Developer/CoreSimulator/Devices/AF77FE8B-F150-421A-A5B0-E291BE9D039D/data/Containers/Data/Application/700F2989-AB36-4AFC-BD40-8998820A0C71/Documents/Untitled.emojiart documentState: [Normal]
    ```
    没有一下输出，说明还是有哪里存在问题的呀
    ```
    documentState changed to .progressAvailable
    documentState changed to .normal
    ```
    好像就是和上面报错的地方有关系，所以要怎么改捏

## MyTips
- alert弹窗
- 同observer代替了原来的不少写法，需要再对照参考答案的详细注释看一看