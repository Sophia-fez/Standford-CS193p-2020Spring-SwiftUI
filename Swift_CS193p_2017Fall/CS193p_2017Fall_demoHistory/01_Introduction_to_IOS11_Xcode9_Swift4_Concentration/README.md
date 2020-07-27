# lecture_1 Demo_Concentration 总结
## Demo Topics: Concentration
- Creating a Project in Xcode 9, including building a UI and running in the iOS Simulator Subclassing in Swift , including how to specify instance variables and methods 
- Connecting UI elements to invoke methods in our Swift code (actions) print (outputting to the console using `\()` notation) Connecting properties (instance variables) from our Swift code to the UI (outlets) 
- `didSet`: Automatically doing something every time a property’s value changes 
- Array 
- Optional: `if let`, `!`

## view模块
- **ViewController.swift**  
    + 在console用 `\()`打印信息
    + 用array存储card
    + 实现 `func flipCard`, 卡片翻面
    + 实现 `func touchCard`， `if let`实现optional, 显示array中对应index的emoji，若index非法则执行`else`中语句防止app崩溃
    + 实现 `flipCountLabel`，用 `didSet` 实现实时计数功能

## model模块

## viewModel模块