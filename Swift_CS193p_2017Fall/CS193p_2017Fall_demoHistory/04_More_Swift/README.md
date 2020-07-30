# lecture_4 Demo_Concentration 总结
## Demo Topics: Concentration
- **Protocol**: Make Card struct **Hashable and Equatable**  
Doing this allows us to make Card’s identifier private  
It also lets us look up Cards directly in a Dictionary (rather than with its identifier)  
And we can use == to compare Cards directly  
And for your homework, supporting Equatable lets you use index(of:) on an Array of things  
- **NSAttributedString**: Make flip count outlined text
- **Closure**: Improve indexOfOneAndOnlyFaceUpCard implementation  
We probably used more lines of code to make indexOfOneAndOnlyFaceUpCard computed However, a better implementation using a method that takes a closure would fix that

## M model模块
- **Concentration.swift**
    + 将class改成struct
    + `func chooseCard`加`mutating`
    + 用 Closure 精简代码，use a method take a closure
    ```
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {  // (newValue)可以省略
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    ```
    换成
    ```
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count = 1 ? faceUpCardIndices.first : nil
        }
        set(newValue) {  // (newValue)可以省略
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    ```
    其中 `faceUpCardIndices` 是 array.index类型的，其实就是Int  
    **fliter是这个method自己的collection，fliter的功能是对collection中每个item执行function，fliter只有一个argument，就是一个function，这个function返回一个bool，对于return true也就是符合条件的element复制到新array里，最后返回这个array**
    + 添加 extension，扩展 `oneAndOnly` 功能，只有当 element 是唯一的时候不是nil
    ```
    extension Collection {
        var oneAndOnly: Element? {
            return count == 1 ? first : nil
        }
    }
    ```
    ```
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set(newValue) {  // (newValue)可以省略
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    ```

- **Card.swift**
    + 使用协议`Hashable`，将`identifier`变为hashable，这样就可以直接用==来判断两个card了

## V view模块(storyboard)
- **Main.storyboard**

## C controller模块
- **ViewController.swift**
    + `private var emoji = [Int:String]()`改为`private var emoji = [Card:String]()`，对应的，在Card的struct里也要增加hashable的protocol
    + 将emoji从String数组变成String
    ```
    private var emojiChoices = ["👻","🎃","👿","🙀","😱","🍎","🍭","🍬"]
    改为
    private var emojiChoices = "👻🎃👿🙀😱🍎🍭🍬"
    ```
    索引也要改，因为String不是Int作为索引，而是String.index
    ```
    let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
    ```
    + 使用NSAttributedString修改 Flips 的样式
    ```
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    ```

## MyTips
- protocol的用法要再研究一下
```    
    // hashable
    var hashValue: Int { return identifier }
 
    // equitable
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
```
其中hashable改成以下的样子（应该是swift版本问题），这点要查一下
```
    // hashable
    var hashValue: Int { return identifier }
    func hash(into hasher: inout Hasher){
        
    }
    
    // equitable
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
```
- NSAttributedString，修改text的样式，甚至可以直接自己绘制UI
- fliter,closure,method,extension
