# assigment_2 Memorize
## Required Tasks
1. 实现 lecture1-4的demo   
2. 仍然要洗牌    
3. 加入 <font color = #e32472>**"theme"**</font> 的概念，一个主题应该有自己的name，不同的emoji集，一定数量的card，注：至少一个theme实现卡片上emoji随机出现（可以看看2017秋学期的课程，有实现这个功能）  
4. 至少支持6种不同的theme  
5. 应该只需要一行代码添加一个新theme  
6. UI上加上 <font color = #e32472>**"New Gamer"**</font> 的按钮，这个按钮需要实现随机选一个theme的功能（可以看看2017秋学期的课程，有实现这个功能）  
7. 在UI的某个地方显示theme的name 
8. 加入 <font color = #e32472>**计分功能**</font>，匹配的卡片给2分，先前翻开过的但没匹配的卡片扣1分 
9. 在UI的某个地方显示分数（可以看看2017秋学期的课程，有实现这个功能，只是现在计分规则变复杂了，要求变高了）  
10. 保证不同设备的模拟器的portrait or landscape（横屏竖屏）都运行正常 

## Hints
1. 尽量高效的代码  
2. 认真思考，哪部分代码应该是Model，哪部分是ViewModel，哪部分是View    
3. 一个theme有多少对牌，可以为对应的theme设置具体的数字，如果没有设置具体的数字就是随机的 
4. 如果像上面说的这么想，那么什么样的type适合代表一个theme里卡片的数量呢？ 
5. "New Game"按钮可以是一个 `Text` with an `onTapGeature`，也可以用 `Button`，前者看起来就是text后者看起来是按钮，所以`Button`更好   
6. theme示例：animals (🐼 🐔 🦄 ), sports (🏀 🏈 ⚾ ), faces (😀 😢 😉 )    
7. 追踪已经翻开过的卡片   
8. 如果翻开 🐧 + 👻 , 然后再翻开 ✏ + 🏀 , 在翻开两个 👻 , 得分就是2，因为匹配+2分没有扣分。如果再翻开 🐧 + 🐼 , 再翻开 🏀 + 🐧 , 得分变成-1，因为扣了3分，因为 🐧 和 🏀 都曾被翻开过。如果再翻开 🐧 + 🐧 , 得分变为1，因为匹配+2分  
9. 允许删除assignment_1的所有代码，尤其可以删除长宽比的相关代码，Grid会代替他们起作用，如果程序崩溃的想清楚为什么。 Lecture_3的slifes里提到的 `aspectRatio` 会有帮助

## Things to Learn
1. eactive UI  
2. Swift 5.2  
3. Arranging UI with `HStack, VStack, Spacer, Divider`, etc.  
4. Handling a tap gesture (or using Button)  
5. MVVM
6. Optionals 

## Extra
1. 支持<font color = #e32472>**渐变色theme**</font>，`fill()`可以把渐变色作为一个属性  
2. 使用struct `Date`实现 <font color = #e32472>**选择卡片越快积分越多**</font>（得到或者扣除）的功能
