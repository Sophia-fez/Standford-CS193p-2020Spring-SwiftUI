# assigment_5 Memorize
## Required Tasks
1. 从“Memorize”游戏中删除“随机卡数”主题选项。 每个主题现在将具有自己的特定的预先定义的卡数，即游戏中有多少张牌是该游戏主题的一部分，并且不再是“随机”的。 
2. 每次启动新游戏时，将用于该游戏的主题的JSON表示输出到控制台。 必须包括主题的所有元素（名称，可供选择的表情符号，要显示多少对卡片以及主题的颜色）。

## Hints
1. 使任何结构持久的最简单方法是使用Codable协议。 Codable可让您使任何结构都具有持久性，但是它具有出色的内置功能，可以自动使包含简单类型（例如，Int，String，Double，CGFloat，URL，数组，字典，集合等）的结构具有持久性。因此，进行此分配的最佳方法是将主题结构修改为仅包含简单类型。除了一个显着的例外，主题的颜色可能已经很像了
2. 可能会将主题的颜色存储为颜色。Color实际上只是一种指定Color的方式（或者它也可以是View或ShapeStyle）。它不是真正的颜色表示。所以需要切换为在主题中使用UIColor。 UIColor是一个实际上代表特定颜色的对象。 
3. 但是，即使UIColor也不能自动编码。因此强烈建议您将主题内的颜色表示为带有4个浮点数的结构：颜色的红色，绿色，蓝色和alpha（透明度）级别（又称RGBA）。下面提供了一些简单的代码，这些代码采用UIColor并返回其中包含4个此类CGFloats的结构。幸运的是，Codable确实知道如何使用CGFloats自动对结构进行编码/解码。
4. 由于您的主题结构现在将以四个CGFloat的结构内部表示其颜色，因此，您需要一种从该结构重构Color或UIColor的方法。下面的代码也可以做到这一点。所以可能需要在主题中提供一些不错的API，以便应用程序中的其他代码甚至不必了解RGBA。 
5. 很可能需要在EmojiArtExtensions.swift中添加的.utf8变量。

## UIColor+RGBA
```
extension Color {
    init(_ rgb: UIColor.RGB) {
              self.init(UIColor(rgb))
    }
}
extension UIColor {
    public struct RGB: Hashable, Codable {
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        var alpha: CGFloat
        }
    convenience init(_ rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: rgb.alpha)
    }
    public var rgb: RGB {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGB(red: red, green: green, blue: blue, alpha: alpha)
    }
} 
```

## Things to Learn
1. Codable
2. JSON Encoding 

## Extra