# lecture_4 Demo_Memorize 总结
## Demo Topics: Memorize
- **Optional in action**  
    + Let’s ﬁx that “bogus” Array method firstIndex(matching:).  
    + Then we’ll make Memorize actually play the game!  
    + Both of these will feature the Optional type prominently.  

## view模块
- **EmojiMemoryGameView.swift**  
    - ContentView.swift rename为EmojiMemoryGameView.swift  
    - 将 `struct ContenView: View{}` 里的 `var body: some View{}` 里的 `HStack{}` 改为 `Grid{}`

- **新建Grid.swift**  
    - 最终效果是自动布局为2*3的卡片布局  
    - 使用 `!` 处理optional (可以使用 `Group{}` 处理option为nil的情况)

- **导入GridLayout.swift**

## extension
- **新建Array+Identifiable.swift**  
    - 根据id寻找index的func在Grid.swift和MemoryGame.swift都用到了，所以把这个func封装到对Array的extension里，并使用constrain限制element是identifiable的Array  
    - 使用option处理找不到对应index的情况
- **新建ArrayOnly.swift**  
    - 对所有的Array生效，当只剩下一个card时候返回他的index

## model模块
- **MemoryGame.swift**
    - `mutating func choose()` 实现卡片的正反面点击效果，对self修改的func都要加mutating  
    - `func index()` 找到所点击的卡片的id
    - 使用 `if let` 来处理optional
    * 实现游戏的卡片匹配功能
        - `var indexOfTheOneAndOnlyFaceUpCard： Int?` 使用这个optional的var跟踪朝上的card  
        - 实现两张卡片匹配则`isMatched = true`，否则只有choose的那一张朝上其余都朝下
        - 使用computed var实现`var indexOfTheOneAndOnlyFaceUpCard： Int?`, `get{} set{}`，`newValue`是一个特殊的var仅出现在`set{}`里面，用于computed property  
        - `$0`的用法
        - 对`get{} set{}`进行了精简，封装了 ArrayOnly 的 extension

## viewModel模块
- **EmojiMemoryGame.swift**  

## 最终效果
主要实现了点击卡片卡片翻面和匹配效果
<img src="./MyDemo_4效果图.png">
<img src="./MyDemo_4匹配功能.png">
