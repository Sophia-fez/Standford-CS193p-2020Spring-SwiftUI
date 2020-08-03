# lecture_8 Demo_PlayingCard 总结
## Demo Topics: PlayingCard
- 

## M model模块
- **PalyingCard.swift**

- **PalyingCardDeck.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + `Outlet Collection`，先把原来占有一整个屏幕的扑克牌取消所有的constrain,然后向lecture01视频末尾那样，复制12张牌出来，并建立`Outlet Collection`，`Outlet Collection`意味着一个array,type记得选`PlayingCardView`，创建完成后`ViewController.swift`里会多出一行代码 `@IBOutlet var cardViews: [PlayingCardView]!`，然后把剩下的牌也脸上这个`Outlet Collection`
    + 在inspect里更改牌面的数字和洪欣方块等，这样storyboard预览里也可以看到12张6组不一样的牌了
    + 所以为什么一直报这个错捏？？？`Exception    NSException *   "[<PlayingCard.ViewController 0x7fad3e208160> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key playingCardView."    0x00006000038823a0`

- **Assets.xcassets**

- **PlayingCardView.swift**

## C controller模块
- **ViewController.swift**
    + 课程视频开头就有的部分除了在lecture06的demo基础上改一下代码，包括删除原来的gesture相关的代码，添加随机分配12张牌的代码，还需要在storyboard里建好`Outlet Collection`，最终多出一行代码`@IBOutlet var cardViews: [PlayingCardView]!`

## MyTips
- 呜呜呜死在了第一步随机分配卡片