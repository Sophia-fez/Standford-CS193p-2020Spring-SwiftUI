# assigment_1 Memorize
## Required Tasks
1. 实现 lecture1-2 的 demo，并且做出如下修改  
2. <font color = #e32472>**洗牌功能**</font>，不要让emoji相同的牌相邻出现（可以看看2017秋学期的课程，有实现这个功能）  
3. 课程里的demo卡片是占满了屏幕的显得很瘦长，将<font color = #e32472>**卡片长宽比调为 2:3**</font>  
4. 游戏开始时有<font color = #e32472>**随机数量的牌**</font>，设置为2-5对  
5. 仅5对牌的时候，将emoji<font color = #e32472>**字体调小**</font>，更少的牌的情况下字体还用 .largeTitle  
6. 保证不同设备的模拟器的portrait or landscape（横屏竖屏）都运行正常

## Hints
1. 尽量高效的代码，Tasks2,3,4,5都可以仅修改一行代码实现  
2. 我们还没有实现 "reactive" 的功能（model每次更新后自动更新view），所以需要在模拟器里反复启动程序来测试代码  
3. 洗牌功能比你想的要简单，好好阅读阅读材料里Array部分  
4. 确保洗牌功能在MVVM的正确的部分，洗牌是一个UI还是Model？  
5. 好好看阅读材料的 View 部分，至少学会搜索查看需要的部分   
6. 函数 Int.random(in：ClosedRange <Int>) 可以生成任意范围内的随机整数，例如，让random = Int.random（in：15 ... 75）可以生成15到75之间的随机整数（包括的75）  
7. 好好看阅读材料的 Font 部分，至少学会搜索查看需要的部分   
8. Task 5也可以只修改一行代码完成，但可能需要使用Swift的“三元”运算符（如，let x = trueTest? foo：bar）来执行此操作   
9. lecture1-2 还没有解决emoji太小了的问题，下次课讲这个

## Things to Learn
1. Xcode 11.4   
2. Swift 5.2    
3. MVVM  
4. 好好看阅读材料的**Array, Font, View**    
5. **Int.random(in:)**  
6. 在不同模拟器上运行程序  

## Extra
1. 随机emoji，不要每场游戏都是一样的emoji，每次游戏都从**emoji集**里选  

## MyTips
1. <font color = #e32472>**洗牌功能**</font>和<font color = #e32472>**New Game 按钮功能**</font>在lecture_6讲了  
2. button 比 a text on tap geature 强大，尽量用button实现功能