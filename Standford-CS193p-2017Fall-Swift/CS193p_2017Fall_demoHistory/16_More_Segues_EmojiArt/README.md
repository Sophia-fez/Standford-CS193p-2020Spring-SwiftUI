# lecture_16 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- Inspector
- Popover
- Unwind：Close Document
- 可以兼容iphone和ipad

## M model模块
- **EmojiArt.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + 添加inspect按钮
    + 添加popover按钮
    + 添加close Document按钮

## C controller模块
- **EmojiArtViewController.swift**
    ```
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Document Info" {
            if let destination = segue.destination.contents as? DocumentInfoViewController {
                document?.thumbnail = emojiArtView.snapshot
                destination.document = document
                if let ppc = destination.popoverPresentationController {
                    ppc.delegate = self
                }
            }
        } else if segue.identifier == "Embed Document Info" {
            embeddedDocInfo = segue.destination.contents as? DocumentInfoViewController
        }
    }
    
    private var embeddedDocInfo: DocumentInfoViewController?
    
    // iphone时不使用适应风格，继续使用popover
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
    ```

- **DocumentInfoViewController.swift**
    + 实现inspect，实现预览图固定宽度不固定长宽比
    + 实现inspect点击空白处就可以返回（啥也没做也可以，是新增的默认功能嘛？？？）
    + 实现popover，并调整到合适的大小（刚好够展示信息内容）
    + popover时不显示预览图、返回文档的按钮，背景磨砂透明化

## MyTips
- 不知道什么时候拖入的emoji不能修改了（移动或者缩放），要检查一下是哪里出问题了_(:з」∠)_