# lecture_10 Demo_Concentration & Cassini 总结
## Demo Topics: Cassini

## M model模块

## V view模块(storyboard)
- **Main.storyboard**
    + 新建一个view controller，class改成`CassiniViewController`,并embed in navigation controller
    + 新建split view controller，并且把已有的页面脸上master & detail
    + 像之前的theme choose一样，`CassiniViewController` 页面上建立三个选择按钮，这次identifier设置和button名称一致的，确保调整了语言后还能打开正确的页面
    + 新建 loading 的 `activity indicator`，并做好constrain
    + 将显示图片的页面embed in navigation controller

## C controller模块
- **DemoURLs.swift**
    + 把 url 改成网络地址

- **ImageViewController.swift**
    + 多线程，解决获取的image过大直接卡住的情况，当加载好image前可以返回
    ```
    private func fetchImage() {
        if let url = imageURL {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    ```

- **CassiniViewController.swift**
    + 实现 button 选择和它对应的 url 的功能
    + 实现 ipad上也显示title的功能

## Demo Topics: Concentration

## M model模块
- **Concentration.swift**
- **Card.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + 新增两行button，加入原来的stack view，新增的两行button都连上 `@IBOutlet private var cardButtons: [UIButton]!`，后面新增的button也要连上
    + 增加了button后就会出现，横屏时，flips 计数按钮就因为屏幕高度不够的问题看不到了，计划竖屏显示4*5，横屏显示5*4的格子，横屏时候 flips 按钮放在右边。解决方案有，横屏下右侧增加四个button，新增一列，横屏时候显示这个4个隐藏原来最下面的一行，竖屏时候这个新增的四个隐藏。将这新增的一列constrain到左边原有的satck view里设置 equal width
    + 害，大佬的参考答案constrain也有问题，上下都有被遮挡的情况
    + 在横屏模式下点击左边的stack view在inspect里设置 height compact，在竖屏模式下点击右边的stack view在inspect里设置width compact，因为之前勾选了equal width，所以这两个hidden设置并勾选后，横屏下就会自动隐藏原来最下面的四个button，竖屏下会自动隐藏右边的四个button
    + 现在可以横屏5*4，竖屏4*5了，但是如果choose的是隐藏部分的，那也会不见了
    + 但是在横屏模式下flips就被遮掉了，我们希望他显示在右边，横屏模式下点击 `vary for traits` 选择 `height`（这个模式下的constrain仅对所选的模式起作用）,然后删除 flips 原来的 constrain，删除card右边的constrain，吧flips移动到右边重新建立constrain
    + 所以为什么在 `vary for traits - height` 的时候，删掉trailling这个constrain整个card stack view都消失不见了，再和flips建立constrain也没用捏？？？最后暂时是直接把card和safe area建立的trailling constrain,但这似乎也导致了后面flips不能分两行显示，计数数字会消失，why???

## C controller模块
- **ConcentrationViewController.swift**
    + 有24个button，但我们实际只用20个，为了旋转屏幕后隐藏的button不影响已经choose的显示
    ```
    private var visibleCardButtons: [UIButton]! {
        return cardButtons?.filter { !$0.superview!.isHidden}
    }

    // 还需要在旋转屏幕后更新
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }
    ```

- **ConcentrationThemeChooserViewController.swift**

- **VCLLoggingViewController.swift**


## MyTips
- 删除storyboard里的image view后，代码实现image view，scroll view的content size一直报错问题依然没有解决 `scrollable content size is ambiguous for scrol view`
- lecture09本地图片显示不出来，现在网络加在的图片还是一样的问题。大佬的参考答案运行出来也是无法显示image，但加载会停止转动并消失，然后拖动会有滚动条，就好像其实显示了image只是看不到一样???
- concentration项目中，在修改横屏模式下，把flips移到右侧时候，删掉card stcak view相对safe area trailling constrain时，整个card stack view都会消失，why???最后暂时保留了相对safe area trailling constrain