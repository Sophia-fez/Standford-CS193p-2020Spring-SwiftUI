# lecture_5 Demo_Memorize 总结
## Demo Topics: Memorize
- **Cardify**  
    + Let’s go implement Cardify in our Memorize application!  
    + We’ll start the next lecture talking about how we animate using ViewModifiers.  

## view模块
- **EmojiMemoryGameView.swift**  
    - AccessControl，加 `private` or `private(set)`   
    - 使用 `.modifier` 把卡片背景部分封装到 Cardify.swift 里  
    - 使用 `.cardifier` ，在 Cardify.swift 里添加 `extension`    

- **Grid.swift**  
    - AccessControl，加 `private` or `private(set)`

- **GridLayout.swift**

- **新建Pie.swift**
    - 绘制emoji后面半透明的一定角度的扇形背景

- **新建Cardify.swift**
    - 将卡片背景部分封装到这里 
    - 对 `View` 添加 `extension`，这样 EmojiMemoryGameView.swift 里只需要调用 cardify 而不是 modifier

## extension
- **Array+Identifiable.swift**  
- **ArrayOnly.swift**  

## model模块
- **MemoryGame.swift**
    - AccessControl，加 `private` or `private(set)`

## viewModel模块
- **EmojiMemoryGame.swift**  
    - AccessControl，加 `private` or `private(set)`

## 最终效果
主要实现了使用shape和ViewModifier重新绘制卡片背景部分  
<img src="./MyDemo_5效果图.png">

