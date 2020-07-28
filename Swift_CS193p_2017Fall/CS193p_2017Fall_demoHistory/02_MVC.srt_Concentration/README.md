# lecture_2 Demo_Concentration 总结
## Demo Topics: Concentration
- MVC
- Initialization
- struct vs. class
- static methods and properties
- more about Optionals
- Dictionary<KeyType,ValueType>
- UIStackView and autolayout

## M model模块
- **Concentration.swift**
    + Concentration这个小游戏的model，包括：
    + cards数组,type是`Card`,`Card`类型在struct里定义
    + 初始化cards数组
        * struct默认都有一个init，`let card = Card(isFaceUp: false, isMatched: false, identifier: identifier)`，但因为`isFaceUp`、`isMatched`已经在struct里初始化为`false`了所以没必要再初始化一遍，所以只需要初始化`identifier`,故在strcut里增加init来初始化`identifier`
        * 使用for循环向cards数组增加card
        ```
        init(numberOfPairsOfCards: Int) {
            for identifier in 1...numberOfPairsOfCards {
                let card = Card(identifier: identifier)
                cards.append(card)
                cards.append(card)
            }
        }
        ```
        但不必这么麻烦
        ```
        init(numberOfPairsOfCards: Int) {
            for identifier in 1...numberOfPairsOfCards {
                let card = Card(identifier: identifier)
                cards += [card, card]
            }
        }
        ```
        因为Array是struct是值类型，通过copy传递，本质上都是复制
        * 因为Concentration game并不关心每个card的`identifier`具体是什么，只要保证是独一无二的就可以了，所以上面这样初始化还是有点不妥，继续改进，在struct里使用 `static func`

    + chooseCard函数，根据index选择卡片，完成匹配、翻面等功能，用一个option类型的`var indexOfOneAndOnlyFaceUpCard: Int?`来实现卡片翻面和匹配的逻辑


- **Card.swift**
    + 使用`struct`建立card的model，属性包括`isFaceUp`、`isMatched`、 `identifier`
    + 在`struct`内用init初始化`identifier`，`init`通常具有相同的内外部名称，用`self.`来区分
    ```
    init(identifier: Int) {
        self.identifier = identifier
    }
    ```
    + 使用 `static func` 向 `Card` 类型获取唯一identifier
    ```
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1 // 每次调用的时候就能自增1，所以是唯一
        return Card.identifierFactory
    }
    // 这边的 Card. 都可以省略
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    ```

## V view模块(storyboard)
- **Main.storyboard**
    + 增加card数量，排列整齐，并和cardButton连好，确保constrain没有问题

## C controller模块
- **ViewController.swift**
    + 使用`lazy`初始化game
    ```
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    ```
    + 根据model修改`func touchCard`
    + 同时还需要更新model,`func updateViewFromeModel`取代`func flipCard`
    + 获取emoji显示在card上，用`Dictionary`来完成identifier和emoji的绑定
    ```
    var emojiChoices = ["👻","🎃","👿","🙀","😱","🍎","🍭","🍬"]
    
    var emoji = [Int:String]()
    ```
    ```
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        // return emoji[card.identifier] ?? "?" // 等效写法 
    }
    ```
    当`touchCard`时`updateViewFromModel`，identifier唯一标识选中的card，在触摸card时，随机分配一个emoji和对应的identifier绑定并存入字典，选取一个emoji就在原数组中删除，保证后面的card上的emoji不重复
    ```
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    ```

