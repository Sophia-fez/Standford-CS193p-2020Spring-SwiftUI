# lecture_9 Demo_Concentration & Cassini 总结
## Demo Topics: Concentration
- View Controller Lifecycle  
Let’s put some print()’s in our multiple-MVC version of Concentration

## M model模块
- **Concentration.swift**
- **Card.swift**

## V view模块(storyboard)
- **Main.storyboard**

## C controller模块
- **ConcentrationViewController.swift**
    + 把`UIViewController`protocol改为`VCLLoggingViewController`
    加入以下代码使打印顺序更清晰
    ```
    override var vclLoggingName: String {
        return "Game"
    }
    ```

- **ConcentrationThemeChooserViewController.swift**
    + 把`UIViewController`protocol改为`VCLLoggingViewController`
    加入以下代码使打印顺序更清晰
    ```
    override var vclLoggingName: String {
        return "ThemeChooser"
    }
    ```
    + 如果把 `func changeTheme` 中防止选择theme后重新开始游戏的代码注释掉，重新调试的话，可以在控制台清晰的看出创建了新游戏

- **VCLLoggingViewController.swift**
    + 直接导入的，在控制台打印生命周期日志


## Demo Topics: Cassini
- Scroll View
    + add subview
    + managing its content size
    + zoom

## M model模块

## V view模块(storyboard)
- **Main.storyboard**
    + 删除原有的view controller
    + 拖入一个 `view controller`, identity inspector里把 class 改成 `ImageViewController`，在normal inspector里勾选 `Is Initial View Controller`，左边的小箭头就回来了
    + 添加 `image view`，布满全屏，并建立outlet
    + 点击右下角的 `add new constrain` 给 imageview 四周都添上constrain，在document outline里选中想要修改的constrain，把 second item 的 safe view are 改成 superview，这样image就能铺满全屏了
    + embed in scroll view，调整大小后，在outline里把constrain也调成super view，还有距离调成0
    + 把 image view 的 `intrinsic Size` 调成 `placeholder`，把 scroll view的大小固定下来，when you are setting constrains between image view and scroll view, you are talking about content area, and that is controlling the size of the content area
    + 删除image View用代码实现，但为什么scroll view还是警告捏，已经是上下左右都constrain 到 superview了呀_(:з」∠)_ 还是content size的警告：`scrollable content size is ambiguous for scrol view`。此问题虽然不知道为什么还是一直有警告，但是无视就好了

## C controller模块
- **ViewController.swift**
    + 删除

- **DemoURLs.swift**
    + 直接导入的文件，存了image的url

- **ImageViewController.swift**
    + 
    ```
    var imageURL: URL? {
        didSet {
            image = nil
            // on screen
            if view.window != nil {
                fetchImage()
            }
        }
    }
    ```
    + 用代码实现scroll view，we want image view to be the content area of the scrollview


## MyTips
- 不管是storyboard还是code实现image view，事实上都不能成功显示image，why??? 大佬的参考答案运行出来也是无法显示image，但是拖动会有滚动条，就好像其实显示了image只是看不到一样???此问题经查证，是给出的standford图片有问题(给的这张图非常神奇)，确实加载出来了，但是在很远的中间，没滚动到正确位置所以看不到，应该是是原图片有问题，自己找一张图片换上去就好了。
- 删除storyboard里的image view后，代码实现image view，scroll view的content size一直报错，why??? `scrollable content size is ambiguous for scrol view`。此问题虽然不知道为什么还是一直有警告，但是无视就好了