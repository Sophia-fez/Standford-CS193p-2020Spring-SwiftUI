# lecture_6 Demo_Memorize 总结
## Demo Topics: Memorize
- **Match Somersault**
    + Let’s have our emoji celebrate when there’s a match!
- **Card Rearrangement**
    + This is just changing the .position modiﬁer on Views.
    + Automatically animated if an animation is in progress.
- **Card Flipping**
    + Cardify can handle this since it is a ViewModiﬁer.
    + It will sync up the 3D rotation animation and the face-up-ness of the card.
- **Card Disappearing on Match**
    + This is a “transition” animation.
- **Bonus Scoring Pie Animation**
    + Make our Pie slice animate.

## view模块
- **EmojiMemoryGameView.swift**  
    - implicit animation, 卡片内容一直旋转的动画
    - 卡片翻面时渐入渐出动画
    - 卡片通过缩放动画出现/消失
    - 卡片背景 <font color = #e32472>**pie随时间减少而减小角度**</font>的动画(这个实现比较复杂)
    - 卡片匹配时emoji旋转动画

- **Grid.swift**  

- **GridLayout.swift**

- **Pie.swift**
    - 使背景的pie转动

- **Cardify.swift**
    - 卡片3D旋转动画
    - 通过设置透明度来隐藏卡片内容达到原来的卡片正反面效果，可以使得isMatched属性晚点设置，这样就有一个更新，卡片内容旋转的animation就可以执行了（*这里还有点不是很明白*）。如果不这样做的话，就会在点击卡片卡片旋转后isMatched的属性才被设置，这时候没有更新，所以旋转的animation就无法执行

## extension
- **Array+Identifiable.swift**  
- **ArrayOnly.swift**  

## model模块
- **MemoryGame.swift**
    - 在 init 里添加洗牌功能，`cards.shuffle()`
    - 增加奖励计时功能

## viewModel模块
- **EmojiMemoryGame.swift**  

## 最终效果
主要实现了以上动画  
<img src="./MyDemo_6效果图.png">
