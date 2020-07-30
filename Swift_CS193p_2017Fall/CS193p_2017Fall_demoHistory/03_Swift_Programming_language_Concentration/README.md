# lecture_3 Demo_Concentration 总结
## Demo Topics: Concentration
- Making Concentration’s button layout dynamic  
We want our UI to work on different iPhones and in both landscape and portrait We’ll do this using **UIStackView and autolayout**  
- Make indexOfOneAndOnlyFaceUpCard be **computed**  
- Make **arc4random** code a lot cleaner
- Make Concentration into a struct (lecture04开头做的)

## M model模块
- **Concentration.swift**
    + `indexOfOneAndOnlyFaceUpCard`也改成computed property，实现`func chooseCard`的一部分功能
    + access control,加上`private`、`private(set)`
    + `func chooseCard`和`init`中添加`assert`

- **Card.swift**
    + access control,加上`private`、`private(set)`

## V view模块(storyboard)
- **Main.storyboard**
    + 使用stack view把卡片组合在一起，只能垂直或者水平组合，也就是一行行或者一列列
    + 然后把12张卡片组合起来后，使用constrain钉到边缘实现自动分布，这样可以自动根据屏幕调整大小

## C controller模块
- **ViewController.swift**
    + card的数量封装成一个computed property
    `lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)`
    改成
    ```
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    ```
    如果只有一个get可以省略写为：
    ```    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    ```
    + access control,加上`private`、`private(set)`
    + `extension Int`

## MyTips
- Extension的用法要再研究一下