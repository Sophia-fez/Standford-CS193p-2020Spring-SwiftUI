# lecture_3 Demo_Memorize 总结
## Demo Topics: Memorize
- **Layout**  
    + Make CardView proportion itself to the size its “offered” by its container.  
    + How do we deal with “magic numbers” in our code in Swift?  
    + Next lecture we’ll lay out our cards in a grid instead of using an HStack.  

## view模块
- **ContentView.swift**  
    + `@ObervedObject var viewModel: EmojiMemoryGame` 加上@ObervedObject后，每次观察对象更新了就会重新绘制UI
    + 将fontSize变为自适应大小的  
    + 对代码进行封装排版，封装后不需要每个都加self.

## model模块
- **MemoryGame.swift**  
    + `mutating func choose()` 实现卡片的正反面点击效果，对self修改的func都要加mutating  
    + `func index()` 找到所点击的卡片的id

## viewModel模块
- **EmojiMemoryGame.swift**  
    + `@Published private var model: MemoryGame<String> = createMemeoryGmae()` 加上@Publishedviewmodel就会即时通知view更新

## 最终效果
主要实现了点击卡片卡片翻面的效果
<img src="./MyDemo_3效果图.png">