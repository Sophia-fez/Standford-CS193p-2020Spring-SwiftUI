# lecture_7 Demo_Concentration 总结
## Demo Topics: Concentration
- Concentration Theme Chooser
We’ll put the MVCs into navigation controllers inside split view controllers That way, it will work on both iPad and iPhone devices

## M model模块
- **Concentration.swift**

- **Card.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + card改成默认蓝，字变成默认黑，背景变成默认白
    + 创建一个 `view controller` 页面，并创建与之对应的subclass `ConcentrationThemeChooserViewController.swift`
    + 点击刚创建的页面上面的小横条，将其对应的class改为 ConcentrationThemeChooserViewController
    + theme button上的文字其实应该做一些处理，去适应不用默认语言的机型
    + 三个 theme button 都和游戏页面建立 `Action segue`，点击每个segue 把 identifier 改成 `Choose Theme`，这就是 `ConcentrationThemeChooserViewController.swift` 里面要是用的identifier
    + 将 `ConcentrationThemeChooserViewController` 页面 embed in `NavigationController`
    + 切换成ipad视角，尝试把theme选择器和游戏页面分屏显示
    + 拖入 `Split View Controller`，会出现默认的四个页面，删除右边多余的三个页面，仅保留左边一个 `Split View Controller` 页面，再把我们原来有的三个页面连上去，master view 和 details view
    + 但这样运行的话会出现一个问题，就是点击theme新游戏不是出现在右边detail页面里而是出现在左边master里。这是因为三个 choose theme 的 segue 的类型都是 `show segue`，需要改成 `show detail`,如果直接在inspect里改不起作用的话就删掉三个segue重新连(这三个segue也是可以用纯代码做的，后面再做)
    + 做了 ipad 的split view重新在一般的iphone上运行也不会有问题的，会自动不是用分屏，在plus上运行横屏状态下还是可以分屏的
    + 拖入 `Tab Bar Controller`，这就是底边bar分栏对应页面的控件，默认已经建了两个空白bar对应的view页面，现在把我们刚才的splitview脸上变成第三个bar对应的页面， control + drag 选择 view controller 就可以了，可以给bar改名，还可以添加icon的image，还能调换bar的顺序
    + 用代码重建 choose Theme 的三个segue, 简历Action后可以不选 UIButton，就选默认的Any
    + 把choose theme 按钮所在页面和 detail 也就是游戏所在页面连起来，identifier设置为 `Choose Theme`

## C controller模块
- **ConcentrationViewController.swift**
    + 因为要建立多个MVC，所以为了区分它们，将`ViewController.swift`重命名为`ConcentrationViewController.swift`
    + 增加theme
    ```
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    ```
    + 原来orange的部分也改颜色
    + 和课程视频里不同的是，`func updateViewFromModel()` 不加 `if cardButtons != nil` 的判断也不会崩溃

- **ConcentrationThemeChooserViewController.swift**
    + 创建存储三个theme的emoji的数组
    + 基本看到Any的时候都要用as
    + 获取 theme
    ```
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName] {
                        
                    }
                }
            }
        }
    }
    ```
    可以简写成如下
    ```
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                
            }
        }
    }
    ```
    + 手动建立的segue
    ```
    @IBAction func changeTheme(_ sender: Any) {
        performSegue(withIdentifier: "Choose Theme", sender: sender)
    }
    ```
    + ipad不重新开始游戏更换theme的功能，在splitview里找ConcentrationViewController
    ```
    if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            cvc.theme = theme
        }
    }
    ```
    ```
    // 在splitViewController的detail里找ConcentrationViewController
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    ```
    但这只能在ipad上起效，因为只有ipad有split view
    + iphone上返回后切换theme但不重新开始游戏，从heap中重新push it on the navigation stack
    ```
    else if let cvc = lastSeguedToConcentrationViewController {
        // iphone上返回后切换theme但不重新开始游戏，从heap中重新push it on the navigation stack
        if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            cvc.theme = theme
        }
        navigationController?.pushViewController(cvc, animated: true)
    }
    ```
    + 取消默认的Helloween主题
    ```
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true // true意味着有 collapse it，但是 you should
            }
        }
        return false // false意味着没有 collapse it，所以 you should do it
    }
    ```


## MyTips
- `as?`
- `segue`
- delegate
- 
```
func splitViewController(
    _ splitViewController: UISplitViewController,
    collapseSecondary secondaryViewController: UIViewController,
    onto primaryViewController: UIViewController
) -> Bool {
    if let cvc = secondaryViewController as? ConcentrationViewController {
        if cvc.theme == nil {
            return true // true意味着有 collapse it，但是 you should
        }
    }
    return false // false意味着没有 collapse it，所以 you should do it
}
```
