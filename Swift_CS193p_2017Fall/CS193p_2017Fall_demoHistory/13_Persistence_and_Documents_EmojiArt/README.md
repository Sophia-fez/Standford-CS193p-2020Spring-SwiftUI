# lecture_13 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- addemoji

## M model模块

## V view模块(storyboard)
- **Main.storyboard**
    + 增加Cell，拖入button作为"+"，增加text field
    + button"+"建立action，sender改成none，type还是none
    + text field建立outlet

## C controller模块
- **EmojiArtViewController.swift**
    + 重写各个drag drop函数
    + 实现addemoji功能

- **EmojiArtDocumentTableViewController.swift**

- **EmojiCollectionViewCell.swift**

- **EmojiArtView+Gestures.swift**

- **TextFieldCollectionViewCell.swift**
    + 新建文档，这是text field对应的class
    + 实现text召唤键盘以及回车会键盘缩回去的功能

## MyTips
- 一下子直接改写了这么多代码emm