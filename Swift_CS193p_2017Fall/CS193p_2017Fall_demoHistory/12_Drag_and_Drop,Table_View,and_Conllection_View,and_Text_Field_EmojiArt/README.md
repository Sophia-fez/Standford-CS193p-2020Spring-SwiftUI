# lecture_12 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- drag & drop
- add & delete

## M model模块

## V view模块(storyboard)
- **Main.storyboard**
    + 删除原来的Emoji Art view,拖入scroll view，并且订到边缘，和之前的Cassini项目一样，会有警告，无视吧_(:з」∠)_
    + 在最上面增加一行collection view并设置高度，一定要选drop zone进行缩小，一开始我直接点的点的是scroll view，后来constrain一直有问题
    + 向collection view 拖入label，为了在storyboard里预览效果，设置一下fontsize（之后要在代码里实现的）并填入一个emoji
    + 增加cell，拖入activity

## C controller模块
- **EmojiArtViewController.swift**

- **EmojiArtDocumentTableViewController.swift**
    + 不需要额外加以下代码，也可以实现侧边栏的功能了,难道是改了？？？
    ```
    // 让侧边栏master可以右划拖出来显示，轻点空白处缩回去
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .primaryOverlay {
            splitViewController?.preferredDisplayMode = .primaryOverlay
        }
    }
    ```
    + 实现图片缩放，如果小于画板那保持在中央（默然是左上角），如果图片大于画板则停留在缩放的地方，通过constrain实现的。因为我希望实现拖拽图片到哪个位置就在哪显示，而不是一直固定在中央的功能，所以这个功能就没做。
    + 在coolection view里显示emoji
    + 实现emoji的drag功能，此时只能拖拽到其他可以放emoji的地方比如拖到浏览器里
    + 实现collectionview为emoji的drag空出位置，从别的app拖过来的String也会有这个效果
    + 实现collectionview内的performdrop，需要更新model也就是emoji列表，还要更新collectionview，需要先做一个遍历emoji列表的效果，然后再做drop动作
    + 实现emoji可以drop到scrollview里
    + 实现对拖入画布emoji放大缩小的功能

- **EmojiCollectionViewCell.swift**
    + 给label建立出口

- **EmojiArtView+Gestures.swift**
    + 直接导入

## MyTips
- 啊，drag和drop的实现，已经迷糊了