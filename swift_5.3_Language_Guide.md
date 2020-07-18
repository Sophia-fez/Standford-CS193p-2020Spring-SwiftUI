# swift 5.3 Language Guide
[swift 5.3官方文档](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)  
[swift 5.3官方文档中文笔记](https://blog.csdn.net/xunciy/category_10183982.html)  
[找到的一个前辈的swift5的中文翻译](https://www.jianshu.com/p/1fef53ccffe7)  
从Protocols开始有不少地方看的不是很懂，后面笔记写的也很粗糙，只音隐约记得17的课程里也有讲过相关方面的只是。之后遇到Protocols、Generics、Access Control等等方面的问题再对照上面前辈的中文版翻译文档和最新英文官方文档，再回来修改补充相关部分的笔记

[TOC]

# 基础介绍
## 常量let & 变量var
```swift
let maximumNumberOfLoginAttempts = 10  // 常量的值设定后不能更改
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0
var red, green, blue: Double // 理论上可以但是实际很少这么写
```
常量和变量名称几乎可以包含任何字符，包括一些Unicode字符。**常量和变量名称不能包含空格，数学符号，箭头，专用的Unicode标量值或线条和框形图字符，不能以数字开头**。不能将常量更改为变量或将变量更改为常量。如果需要命名为保留的Swift关键字名称，在关键字两端加上反引号`，不建议使用保留的keyword。

string interpolation打印法，**使用 `\()` 打印**
```swift
print("The current value of friendlyWelcome is \(friendlyWelcome)") 
```
## 注释
```swift
// 单行注释
/* 多行注释
可以嵌套 */
```
## 分号
可以写也可以不写，一般不写分号。如果要在一行上编写多个单独的语句，则需要分号。
## 整数
Swift提供8位，16位，32位和64位形式的有符号和无符号整数。其中8位无符号整数的类型为UInt8，而32位有符号整数的类型为Int32。一般使用Int就可以了。
```swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
```
在大多数情况下，无需选择特定大小的整数即可在代码中使用。Swift提供了额外的整数类型，Int其大小与当前平台的本机字大小相同：在32位平台上，Int与大小相同Int32；在64位平台上，Int与大小相同Int64。Swift还提供了一个无符号整数类型，UInt其大小与当前平台的本机字大小相同。
## 浮点值
- Double 表示一个64位浮点数，精度至少为15个十进制数字
- Float 表示一个32位浮点数，精度可以低至6个十进制数字
## 类型推断 & Type Safety
当声明具有初始值的常量或变量时，swift根据类型推断来确定常量或者变量的类型，但如果没有初始值就需要明确给定改常量或变量的类型：`var welcomeMessage: String`
在浮点值里面默认都是Double
## 数字
```swift
let decimalInteger = 17			  // 十进制数，无前缀
let binaryInteger = 0b10001       // 二进制数，前缀0b
let octalInteger = 0o21           // 八进制数，前缀0o
let hexadecimalInteger = 0x11     // 十六进制数，前缀0x
```
浮点文字可以是十进制（不带前缀）或十六进制（带0x前缀）。它们的小数点两侧必须始终有一个数字（或十六进制数字）。小数浮点数也可以有一个可选的指数，用大写或小写表示e; 十六进制浮点数必须具有指数，以大写或小写表示p。
对于指数为的十进制数字exp，基数乘以10^exp：
- 1.25e2表示1.25 x 10^2，或125.0。
- 1.25e-2表示1.25 x 10^-2，或0.0125。

对于指数为的十六进制数exp，将基数乘以2^exp：
- 0xFp2表示15 x 2^2，或60.0。
- 0xFp-2表示15 x 2^-2，或3.75。

```swift
let decimalDouble = 12.1875			// 十进制
let exponentDouble = 1.21875e1		// 指数形式
let hexadecimalDouble = 0xC.3p0		// 十六进制
```
## 数值类型转换
```swift
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
```
## 类型别名typealias
类型别名为现有类型定义备用名称，可以使用typealias关键字定义类型别名。  
想通过上下文更合适的名称来引用现有类型时，例如使用外部源中特定大小的数据时，类型别名非常有用：

```swift
typealias AudioSample = UInt16
```

定义类型别名后，可以在任何可能使用原始名称的地方使用别名：

```swift
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
```

在这里，AudioSample被定义为的别名UInt16。因为它是一个别名，调用AudioSample.min实际调用UInt16.min，它提供的初始值0的maxAmplitudeFound变量。
## 布尔值 Bool
有两个布尔常量值，true以及false
## 元组 Tuples
元组将多个值分组为一个复合值。元组中的值可以是任何类型，而不必彼此相同。下例描述HTTP状态代码的元组。如果请求的网页不存在，则返回状态404 Not Found

```swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
```
可以将元组的内容分解为单独的常量或变量，然后像往常一样访问它们：

```swift
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
```

如果只需要一些元组的值，则在分解元组时，请用下划线_忽略该元组的某些部分：

```swift
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
```

或者，使用从零开始的索引号访问元组中的各个元素值：

```swift
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
```

定义元组时，可以命名元组中的各个元素：

```swift
let http200Status = (statusCode: 200, description: "OK")
```

如果在元组中命名元素，则可以使用元素名称来访问这些元素的值：

```swift
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"
```

**具有多个返回值的函数使用元组特别合适。**
元组对于简单的一组相关值很有用。它们不适合创建复杂的数据结构。如果您的数据结构可能更复杂，则将其建模为类或结构，而不是元组。
## Optionals
Optionls表示要么有一个值并且可访问该值，或者为nil。
以下示例使用初始化程序尝试将 String转换为Int，由于初始化程序可能失败，因此它返回一个optional Int而不是一个Int。

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"
```

如果定义一个可选变量而不提供默认值，则该变量将自动nil为您设置为：

```swift
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
surveyAnswer = nil		// 也可以给optional赋值为nil
```
**1. 可选值的强制展开**
一旦确定可选选项确实包含一个值，就可以**在可选名称的末尾添加一个感叹号!来访问其基础值**。

```swift
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."
```
**2. Optional Binding**
Optional Binding一般与if 和 while语句一起使用，以检查可选内部的值，并将该值提取到常量或变量中，作为单个操作的一部分。

```swift
if let constantName = someOptional {
    statements
}

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
```
如果Int返回的可选Int(possibleNumber)内容包含一个值，请为该可选内容中包含的值设置一个新的常量actualNumber。如果转换成功，则该actualNumber常量可在if语句的第一分支中使用。它已经被初始化与包含在值内可选的，因此没有必要使用!后缀来访问它的价值。

您可以根据需要在单个if语句中包含尽可能多的可选绑定和布尔条件，以逗号分隔。如果可选绑定中的nil任何值是或任何布尔条件求和false，则整个if语句的条件视为false。

```swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
```
**3. 隐式展开的Optionals**
隐式解包的可选对象视为允许在需要时强制打开可选对象的权限
```swift
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
```
当变量可能nil在以后出现时，请不要使用隐式展开的可选。
## 错误处理
当函数遇到错误条件时，它将引发错误。该函数的调用方可以捕获错误并做出适当响应。

```swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}
```

函数通过throws在其声明中包含关键字来表明它可以引发错误。当调用可能引发错误的函数时，会将try关键字放在表达式的前面。  
Swift会自动将错误传播到当前范围之外，直到由catch子句处理为止。

```swift
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
```

一条do语句创建一个新的包含范围，该范围允许将错误传播到一个或多个catch子句。  
这是一个示例，说明如何使用错误处理来响应不同的错误情况：

```swift
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
```

在此示例中，makeASandwich()如果没有干净的盘子或缺少任何配料，该函数将引发错误。因为makeASandwich()会抛出错误，所以函数调用被包装在一个try表达式中。通过将函数调用包装在一条do语句中，抛出的任何错误都将传播到提供的catch子句中。

如果未引发任何错误，eatASandwich()则调用该函数。如果抛出错误并且匹配SandwichError.outOfCleanDishes大小写，则将washDishes()调用该函数。如果引发了一个错误并且与SandwichError.missingIngredients大小写匹配，则buyGroceries(_:)使用模式[String]捕获的关联值调用该函数catch。
## Assertions & Preconditions（待研究）
断言和前提条件是在运行时进行的检查。可以使用它们来确保在执行任何其他代码之前满足基本条件。如果断言或前提条件中的布尔条件求值为true，则代码将照常继续执行。如果条件的计算结果为false，则程序的当前状态无效；否则，结果为0。代码执行结束，您的应用程序终止。  
可以使用断言和前提条件来表达您在进行编码时所做的假设和期望，因此可以将其包含在代码中。断言可帮助在开发过程中发现错误和不正确的假设，前提条件可帮助检测生产中的问题。
### Assertions 
通过调用Swift标准库中的函数`assert(_:_:file:line:)`来编写断言

```swift
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >= 0.
```

在此示例中，如果值为负，则age >= 0就是false，断言失败，从而终止应用程序。

您可以省略断言消息`assert(age >= 0)`  
如果代码已经检查了条件，则可以使用该assertionFailure(_:file:line:)函数指示断言失败。例如：

```swift
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
```

### Enforcing Preconditions
当可能的情况为false时使用Preconditions，但必须肯定是真的对你的代码继续执行。例如，使用Preconditions检查下标是否未超出范围，或检查是否已向函数传递了有效值。

可以通过调用precondition(_:_:file:line:)函数来编写Preconditions。

```swift
// In the implementation of a subscript...
precondition(index > 0, "Index must be greater than zero.")
```

也可以调用该preconditionFailure(_:file:line:)函数以指示发生了故障。

# 基本运算符
## 元组之间的比较
两个元组具有相同的类型和相同数量的值，则可以比较它们。元组从左到右进行比较，一次比较一个值，直到比较发现两个不相等的值。将这两个值进行比较，然后比较的结果确定元组比较的整体结果。如果所有元素相等，则元组本身相等。

```swift
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
```
Swift标准库包含用于少于七个元素的元组的元组比较运算符。要比较具有七个或更多元素的元组，必须自己实现比较运算符。
## Nil-Coalescing Operator
```swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"
```
## Range运算符
`a...b`       表示 [a,b]  
`a..<b`       表示 [a,b)  
`names[2...]`     names数组索引2到末尾  
`names[...2]`     names数组索引0到2  
`names[..<2]`     names数组索引0到1  

## 逻辑判断

```swift
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
// If we’ve entered the correct door code and passed the retina scan, or if we have a valid door key, or if we know the emergency override password, then allow access.
```
**Swift逻辑运算符&&和||是左关联的，这意味着具有多个逻辑运算符的复合表达式首先评估最左边的子表达式。**
当然，添加括号后逻辑会更加清楚
```swift
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```
# 字符串Strings和字符Characters
## 多行字符串文字用三引号 """
两个"""之间的字符串都作为多行字符串的值，如果仅想在代码里换行是代码易读，可以在换行符前添加反斜杠转义
```swift
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
```
swift可以自动推断多行字符串里的缩进，如下面的例子，缩进被忽略，只有第二行的四个空格包括在了多行字符串内
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200711165302962.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 转义字符串
\0（空字符）
\\（反斜杠）
\t（水平制表符）
\n（换行符）
\r（回车）
\"（双引号）
\'（单引号）
任意的Unicode标值，写为\u{n}，其中n是一个1-8位十六进制数

```swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

//因为多行字符串文字使用三个双引号而不是一个双引号，可以在多行字符串文字中包含一个双引号而不进行转义。
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
```
## Extended String Delimiters（待研究）
 `#"Line 1\nLine 2"#` 用 (\n) 打印转行的String
 使用 `#"Line 1\#nLine 2"#` 代替`#"Line 1\nLine 2"#` ，`###"Line1\###nLine2"###` 也是两行

```swift
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
```
## 初始化字符串
```swift
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
```
## 字符character

```swift
for character in "Dog!" {
    print(character)
}
// D
// o
// g
// !

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three
```
## String Interpolation: \\()
```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
```
## .count
```swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"
```
## 访问和修改String
```swift
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a


greeting[greeting.endIndex] // Error
greeting.index(after: greeting.endIndex) // Error


for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
```

```swift
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
```
## 子串

```swift
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
```
greeting是一个字符串，这意味着它具有一个存储区域，用于存储组成该字符串的字符。因为beginning是的子字符串greeting，所以它重复使用了所greeting使用的内存。相反，newString是一个字符串-从子字符串创建它时，它具有自己的存储空间。
准备长时间存储结果时，可以将子字符串转换为字符串
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200711182839781.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 比较字符串
可以用 == 或者 !=
```swift
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
```
**使用前缀 `hasPrefix(_:)` 后缀比较 `hasSuffix(_:)`**

```swift
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
```
## Unicode编码 & UTF-16（待研究）

```swift
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"
```

# Collection
三种collection： array有序集合, set唯一值的无序集合, dictionarie键-值关联的无序集合。
## Array

```swift
var arr = Array<Int>    // 空数组，两种方式，一般采用[]
var someInts = [Int]()  // 简写
someInts.append(3)      // someInts now contains 1 value of type Int
someInts = []           // someInts is now an empty array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```
增删改查
```swift
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items
var shoppingList = ["Eggs", "Milk"]  // 类型推断

print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// Prints "The shopping list is not empty."

shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items，将索引[4,6]的元素换成["Bananas", "Apples"] 

// insert和remove操作后，其他元素顺移
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items，索引0位置插入为"Maple Syrup"

let mapleSyrup = shoppingList.remove(at: 0)
// shoppingList now contains 6 items, 删除索引0位置的元素，并且返回该位置元素的值
let apples = shoppingList.removeLast()  //避免查询.count检查是否越界

for item in shoppingList {
    print(item)
}
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
```
## Set
类型必须是可哈希的才能存储在Set中

```swift
var letters = Set<Character>()  // Set没有简写
letters.insert("a") // letters now contains 1 value of type Character
letters = []        // letters is now an empty set, but is still of type Set<Character>
```
增删改查

```swift
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]  //类型推断

print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items

// .removeAll()删除全部元素
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."

for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop

for genre in favoriteGenres.sorted() {  // 按<的顺序返回
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020071211394394.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
- `intersection(_:)`方法创建仅具有两个集合共有的值的新集合。
- `symmetricDifference(_:)`方法创建一个新集合，其中两个集合中都有一个值，但不能同时包含两个集合中的值。
- `union(_:)`方法创建一个包含两个集合中所有值的新集合。
- `subtracting(_:)`方法创建一个新集合，其值不在指定集合中。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200712114230758.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
- `==`确定两组是否包含所有相同的值。
- `isSubset(of:)`方法确定集合中的所有值是否都包含在指定集合中。
- `isSuperset(of:)`方法确定集合是否包含指定集合中的所有值。
- `isStrictSubset(of:)`或`isStrictSuperset(of:)`方法确定集合是子集还是超集，但不等于指定的集合。
- `isDisjoint(with:)`方法确定两个集合是否没有共同的值。

## Dictionary
字典Key类型必须符合Hashable协议

```swift
var dic = Dictionary<Key, Value>
var namesOfIntegers = [Int: String]()   // 简写
// namesOfIntegers is an empty [Int: String] dictionary
namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
```
增删改查
```swift
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// 当key和value是同一类型的时候，swift可以进行类型推断

print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// Prints "The airports dictionary is not empty."

airports["LHR"] = "London"
// the airports dictionary now contains 3 items
airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."
// updateValue(_:forKey:)方法返回字典值类型的可选值。

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]
let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
```
Swift的Dictionary类型没有定义的顺序。要以特定顺序遍历字典的键或值，可以在keys或values属性上使用sorted()。

# Control Flow
## for in 循环
```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// index是一个常数无需声明
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
// 如果不需要索引值，怎可以使用 下划线_ 代替
```

```swift
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
```
## While 循环
- while 每次循环执行时都会评估其条件。
- repeat- while在每次循环结束时评估其条件。在考虑循环条件之前，会先执行一次循环循环。然后，它将继续重复循环，直到条件为false。类似于 do - while

```swift
while condition {
    statements
}

repeat {
    statements
} while condition
```

## 条件语句
### if
多个判断条件可以用逗号连接
### switch
break在Swift中不是必需的，但是可以使用break语句来匹配和忽略特定的情况，或者在该情况完成执行之前中断匹配的情况。
每个case都必须包含一个可执行语句，一个case两种value用逗号隔开
```swift
switch some value to consider {
case value 1:
    respond to value 1
case value 2,
     value 3:
    respond to value 2 or 3
default:
    otherwise, do something else
}

//间隔匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."
```
```swift
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"
```
(0，0）可以匹配所有四种情况。但是，如果可能有多个匹配项，则始终使用第一个匹配情况，所有其他匹配情况都将被忽略。
### Value Bindings
```swift
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"

// 复核case
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"
```
该switch陈述没有任何default理由。但最后一个case，声明了两个可以匹配任何值的占位符常量的元组。因为始终是两个值的元组，所以此情况与所有可能的剩余值匹配，并且不需要使情况穷举的情况。
### where
```swift
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"
```
## Control Transfer Statements
- continue
- break
- fallthrough
- return
- throw
## Labeled Statements（待研究）

```swift
label name: while condition {
    statements
}

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
```
如果break上面的语句不使用gameLoop标签，它将脱离该switch语句，而不是该while语句。使用gameLoop标签可以清楚地表明哪个控制语句应该终止。
## Early Exit：guard（待研究）

```swift
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
```
如果满足guard语句的条件，则执行在该guard语句的右括号后的代码。在guard语句出现的条件绑定，在其余代码部分依然有效。

如果不满足该条件，则执行else分支内的代码。该分支必须转移控制权以退出该guard语句所在的代码块。它可以控制转移语句做到这一点，如return，break，continue，throw，也可以调用一个函数或方法不返回，如`fatalError(_:file:line:)`。
## 检查API可用性（待研究）

```swift
if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
```
上面的可用性条件指定在iOS中，if语句主体仅在iOS 10及更高版本中执行；在macOS中，仅在macOS 10.12及更高版本中。最后一个参数*是必需的，它指定在任何其他平台上，if执行程序的主体均在目标所指定的最小部署目标上执行。

# Function
## Function
只用return一行编写的任何函数都可以省略return。
```swift
// 没有参数
func sayHelloWorld() -> String {
    return "hello, world"
}

// 多个参数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

// 没有返回值
func greet(person: String) {
    print("Hello, \(person)!")
}
```

```swift
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value
```
第一个函数printAndCount(string:)打印一个字符串，然后将其字符计数返回为Int。第二个函数printWithoutCounting(string:)调用第一个函数，但忽略其返回值。当调用第二个函数时，第一个函数仍会打印该消息，但是不使用返回的值。

### 具有多个返回值的函数
可以使用元组类型作为函数的返回类型，以将多个值作为一个复合返回值的一部分返回。

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
```
在从函数返回元组时不必命名元组的成员，因为它们的名称已作为函数返回类型的一部分指定。
### 返回Optional

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
```
## 内部外部名称： Argument Labels and Parameter Names

```swift
// 指定参数标签
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

// 内外部名称一致，省略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)
```
### 默认参数值
可以通过在参数的类型之后为该参数分配值来为函数中的任何参数定义默认值。如果定义了默认值，则可以在调用函数时忽略该参数。
```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
```
### 可变参数
一个函数最多可以具有一个可变参数。
通过...在参数的类型名称后插入三个句点字符（...）来编写可变参数。

下面的示例为任意长度的数字列表计算算术平均值（也称为average）：

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```
### In-Out 参数
函数参数默认为常量，如果希望函数修改参数的值，并且希望这些更改在函数调用结束后仍然存在，请将该参数定义为In-Out Parameters。

只能将变量作为输入输出参数的参数传递。您不能将常量或文字值作为参数传递，因为无法修改常量和文字。当您将一个与号（&）作为变量传入in-out参数时，将它放在变量名的前面，以指示该变量可以被函数修改。

输入输出参数不能具有默认值，并且可变参数不能标记为inout。

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```
## Function Types
由函数的参数类型和返回类型组成，如(Int, Int) -> Int

```swift
// () -> Void
func printHelloWorld() {
    print("hello, world")
}
```
### 使用Function Types
可以将常量或变量定义为函数类型，然后为该变量分配适当的函数：
```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
```
“定义一个名为mathFunction的变量，其类型为一个具有两个Int值并返回Int值的函数。” 设置这个变量来表示函数addTwoInts。”

```swift
print("Result: \(mathFunction(2, 3))")  // Prints "Result: 5"

let anotherMathFunction = addTwoInts  // 类型推断
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
```
### Function Types作为另一个函数的参数类型
```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"
```
本示例定义了一个名为printMathResult(_:_:_:)的函数，该函数具有三个参数。第一个参数名为mathFunction，类型为(Int, Int) -> Int。第二个和第三个参数分别名为a和b，并且均为type Int。
### Function Types作为返回类型
```swift
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!
```
## 嵌套函数
嵌套函数默认情况下对外界隐藏，但仍可以由其封闭函数调用和使用。封闭函数还可以返回其嵌套函数之一，以允许该嵌套函数在另一个作用域中使用。
可以重写chooseStepFunction(backward:)并返回嵌套函数：

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
```
# Closure
- 全局函数是具有名称且不捕获任何值的闭包。
- 嵌套函数是具有名称的闭包，可以从其闭包函数捕获值。
- 闭包表达式是用轻量级语法编写的未命名的闭包，可以从其周围的上下文中捕获值。

Swift的闭包表达式特点：
- 从上下文推断参数和返回值类型
- 单表达式闭包的隐式返回
- 速记参数名称
- 尾随闭包语法

## 闭包表达式（各种省略方式）
闭包表达式语法具有以下一般形式：
```swift
{ (parameters) -> return type in
    statements
}
```

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// 闭包写法
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 从上下文推断类型
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

// 单表达式可以省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 } )

// Operator Methods
reversedNames = names.sorted(by: >)
```
## 尾随闭包

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

// 闭包表达式作为函数或方法的唯一参数
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
reversedNames = names.sorted { $0 > $1 }
```

```swift
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// number的类型可以从要映射的数组中的值推断出来
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output  //字典下标返回的是一个可选值
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
```
如果一个函数使用多个闭包，则可以省略第一个尾随闭包的参数标签，并标记其余的尾随闭包。
```swift
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: someServer) { picture in
    someView.currentPicture = picture
} onFailure: {
    print("Couldn't download the next picture.")
}
```
在此示例中，该loadPicture(from:completion:onFailure:)函数将其网络任务分派到后台，并在网络任务完成时调用两个完成处理程序之一。通过这种方式编写函数，可以使您将负责处理网络故障的代码与成功下载后更新用户界面的代码完全区分开，而不必使用只处理两种情况的闭包。
## 捕获上下文的value
最简单的可以Capturing Values的闭包形式是嵌套函数，它写在另一个函数的主体内。嵌套函数可以捕获其外部函数的任何自变量，还可以捕获在外部函数内定义的任何常量和变量。

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```
## 函数和闭包是引用类型
将函数或闭包分配给常量或变量时，实际上就是在将该常量或变量设置为对该函数或闭包的引用。

```swift
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7

incrementByTen()
// returns a value of 40
```
如果将闭包分配给两个不同的常量或变量，则这两个常量或变量都引用同一个闭包。下例调用alsoIncrementByTen与相同incrementByTen，它们都引用相同的闭包，所以它们都递增并返回相同的运行总计。

```swift
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
```
## Escaping Closures(关于self的问题待研究)
当闭包作为函数的参数传递给闭包时，闭包被认为是对函数的转义，但是在函数返回后会被调用。声明将闭包作为其参数之一的函数时，可以@escaping在参数的类型之前编写，以指示允许对闭包进行转义。
闭包可以escaping的一种方法是将这个闭包存储在函数外部定义的变量中。
```swift
var completionHandlers = [() -> Void]()
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```
该someFunctionWithEscapingClosure(_:)函数将闭包作为其参数，并将其添加到在函数外部声明的数组中。如果未使用标记该函数的参数@escaping，则会出现编译时错误。

**如果self引用一个class的实例，则引用self的转义闭包需要特别考虑，可能会形成cycle。**
 例如，在下面的代码中，传递给`someFunctionWithEscapingClosure（_ :)`的闭包显式地引用了`self`。 相比之下，传递给`someFunctionWithNonescapingClosure（_ :)`的闭包是nonescaping closure，这意味着它可以隐式引用self。

```swift
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"
```

```swift
// 通过将self包含在闭包的捕获列表中来捕获self，然后隐式地引用self：
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
```
## Autoclosures（待研究）
Autoclosures可以延迟evaluation，因为在调用闭包之前，内部代码不会运行。延迟评估对于具有副作用或计算量大的代码很有用，因为它使您可以控制何时评估该代码。
```swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
```
如果从不调用闭包，则闭包内部的表达式不会被求值，这意味着数组元素不会被删除。

```swift
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"


// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
```
serve(customer:)上面清单中的函数采用显式闭包，该闭包返回客户的姓名。下面的版本serve(customer:)执行相同的操作，但不是采用显式的关闭，而是通过使用@autoclosure属性标记其参数类型来进行自动关闭。现在，您可以像调用带String参数而不是使用闭包一样调用函数。参数将自动转换为闭包，因为customerProvider参数的类型已用@autoclosure属性标记。

如果要允许自动关闭功能可以转义，请同时使用@autoclosure和@escaping属性。

```swift
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
```

# Enumerations
## enum语法

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionToHead = CompassPoint.west
directionToHead = .east     // 类型推断

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"
```
## 遍历enum

```swift
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```
## Associated Values 

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// 如果都是let或者var可以放到前面去
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."
```
## Raw Values
```swift
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```
### Implicitly Assigned Raw Values

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 当整数用于原始值时，每种情况的隐式值都比前一种情况大一。如果第一种情况未设置值，则其值为0。

enum CompassPoint: String {
    case north, south, east, west
}
// CompassPoint.south其隐式原始值为"south"，依此类推。

let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"

let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"
```
## Recursive Enumerations
加前缀 `indirect`

```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
// (5 + 4) * 2

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
// Prints "18"
```
# Structures and Classes
Swift不需要为自定义结构和类创建单独的接口和实现文件，**可以在单个文件中定义结构或类，并且该类或结构的外部接口会自动提供给其他代码使用。**
## struct和class的共同点和区别
- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- 可以用extension扩展其功能
- 符合protocols以提供standard functionality 

class具有struct没有的其他功能：
- 继承使一个类可以继承另一个类的特征。
- 通过类型转换，可以在运行时检查和解释类实例的类型。
- 反初始化程序使类的实例可以释放其已分配的所有资源。
- 引用计数允许对一个类实例进行多个引用。

```swift
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 创建实例（对象）
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 访问属性
print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"

// struct具有Initializers，class需要init
let vga = Resolution(width: 640, height: 480)
```
## struct和enum是value type值类型的
Swift中的所有基本类型（整数，浮点数，布尔值，字符串，数组和字典）都是值类型，所有结struct和enum都是值类型。这意味着创建的任何struct和enum实例以及它们具有的任何值类型作为属性，都将在它们在代码中传递时始终被**复制**。
由标准库定义的集合（例如数组，字典和字符串）使用优化来降低复制的性能成本。这些集合不共享立即复制的功能，而是共享存储在原始实例和任何副本之间的元素的内存。如果修改了集合的副本之一，则在修改之前就将元素复制。您在代码中看到的行为始终就像是立即进行了复制一样。

## class是引用类型
与值类型不同，将引用类型分配给var或let或将其传递给函数时，不会复制引用类型，而是都是同一个实例的引用。

可以通过 `===` 或者 `!==` 比较两个是否引用相同的实例
 `===` 表示var或者let都引用同一个实例，而`==`表示两个实例的值相等
```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
```
## 指针
引用某种引用类型的实例的var或let类似于C中的指针，但不是指向内存中地址的直接指针，并且不需要写星号（*）来表示 您正在创建参考。 相反，这些引用的定义与Swift中的其他任何var或let一样。 

# Properties
## Stored Properties

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int  //创建后无法修改
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4) //创建后无法修改
// this range represents integer values 0, 1, 2, and 3
rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
```
## Lazy Stored Properties
Lazy Stored Properties在首次使用之前不会计算其初始值。

```swift
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

// 仅在首次访问该属性时才创建该属性的DataImporter实例
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"
```
## Computed Properties: get, set

```swift
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"

// newValue
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {  // 省略return
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 只读的property可以省略get{}
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"
```
## Property Observers
可以在以下位置添加Property Observers：
- 定义的Stored properties
- 继承的Stored properties
- 继承的Computed properties
对于继承的属性，可以通过在子类中重写该属性来添加属性观察器。对于定义的计算属性，请使用属性的setter观察并响应值更改，而不是尝试创建观察者。

可以选择在属性上定义这些观察者之一或全部：
- willSet 在值存储之前被调用。则它将新的属性值作为常量参数传递。可以在实现中为此参数指定名称willSet。如果您未在实现中编写参数名称和括号，则该参数的默认参数名称为newValue。
- didSet 新值存储后立即调用。则会传递一个包含旧属性值的常量参数。您可以命名参数或使用默认参数名称oldValue。如果您在其自己的didSet观察器中为属性分配值，则分配的新值将替换刚刚设置的值。

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
```
## Property Wrappers
使用属性包装器时，定义包装器时，只需编写一次管理代码，然后通过将其应用于多个属性来重用该管理代码。

```swift
// 该TwelveOrLess struct确保包装的值始终 <= 12的数字
@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"

// 将其属性包装在TwelveOrLess结构中，而不是将@TwelveOrLess编写为属性
struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
```
### 几种init方法
使用此属性包装器的代码不能为被包装的属性指定其他初始值，如SmallRectangle不能给出height或width初始值的定义。所以属性包装器需要添加一个初始化程序。

```swift
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

//通过init()初始化
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}
var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// Prints "0 0"


// 通过init(wrappedValue:)初始化
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// Prints "1 1"


// 通过init(wrappedValue:maximum:)初始化
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// Prints "5 4"
```

```swift
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12"
```
height通过SmallNumber(wrappedValue: 1)初始化，default的最大值是12
weight通过SmallNumber(wrappedValue: 2, maximum: 9)初始化，最大值是9
## Projecting a Value From a Property Wrapper：$

```swift
@propertyWrapper
struct SmallNumber {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"
```
当从属于类型一部分的代码中访问projected value时（如属性获取器或实例方法），可以self.像访问其他属性一样在属性名称之前省略。下面例子height 和width的projected value是$height 和 $width

```swift
enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}
```
## 全局和局部变量
全局常量和变量总是 computed lazily。与 Lazy Stored Properties不同，全局常量和变量不需要用lazy修饰符标记。
局部常量和变量绝不会延迟计算。
## Type Properties（待研究）
Instance properties实例属性是属于特定类型的实例的属性。每次创建该类型的新实例时，它都有自己的属性值集，与其他任何实例分开。可以定义属于类型本身的属性，而不是属于该类型的任何一个实例的属性。

```swift
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"
```

# Methods
Methods是与特定类型关联的函数。类，结构和enumerations都可以定义实例方法，这些实例方法封装了用于处理给定类型的实例的特定任务和功能。类，结构和枚举也可以定义与类型本身关联的类型方法。
## Instance Methods
实例方法是属于特定类，结构或枚举的实例的函数。它们通过提供访问和修改实例属性的方式，或者通过提供与实例目的相关的功能，来支持那些实例的功能。

```swift
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0
```
类型的每个实例都有一个称为的隐式属性self，它与实例本身完全等效。

```swift
func increment() {
    self.count += 1
}

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x   //用self消除歧义
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"
```
## 从实例方法中修改值类型 mutating
结构和枚举是值类型。默认情况下，不能从其实例方法中修改值类型的属性。在func前面添加mutating关键字，可以从方法内部更改（即更改）其属性，并在方法结束时将其所做的任何更改写回到原始结构。
下例，Point上面的结构定义了一种变异moveBy(x:y:)方法，该方法将Point实例移动一定量。实际上，此方法不是返回新的点，而是修改了调用它的点。
```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"

let fixedPoint = Point(x: 3.0, y: 3.0)  // 不能在struct的let上调用Mutating methods
fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error
```
## Mutating methods 中分配给self
Mutating methods 可以为隐式self属性分配一个全新的实例。Point上面显示的示例可能是通过以下方式编写的：

```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
```

```swift
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off
```
## Type Methods
实例方法是您在特定类型的实例上调用的方法，还可以定义在类型本身上调用的方法。
```swift
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()
```
在类型方法主体内使用的任何不合格的方法和属性名称都将引用其他类型级别的方法和属性。一个类型方法可以使用另一个方法的名称来调用另一个类型方法，而无需在其前面加上类型名称。同样，结构和枚举上的类型方法可以使用类型属性的名称访问类型属性，而无需使用类型名称前缀。

这里有一个例子`struct LevelTracker {}`可跟踪玩家在游戏的不同级别或阶段的进度，暂不放入。

# 下标Subscript
Classes, structures, enumerations都可以定义Subscript，这些下标是用于访问集合，列表或序列的成员元素的快捷方式。subscripts可以是读写的也可以是只读的，应get{}和set{}实现

```swift
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}

// 只读，省略get{}
subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"
```
## 下标用法
下标通常用作访问集合，列表或序列中的成员元素的快捷方式。Dictionary类型实现了下标来设置和检索Dictionary实例中存储的值，键值下标接受并返回type Int?或“ optional int”的值

```swift
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
```
下标可以采用任意数量的输入参数，并且这些输入参数可以是任何类型。下标还可以返回任何类型的值。与function不同，下标不能使用输入输出参数。
```swift
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

let someValue = matrix[2, 2]
// This triggers an assert, because [2, 2] is outside of the matrix bounds.
```
上面的示例创建一个Matrix具有两行两列的新实例。该实例的grid数组Matrix实际上是矩阵的展平版本，从左上角到右下角读取：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714173805103.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714173721351.png)
## Type Subscripts
如上所述，实例下标是您在特定类型的实例上调用的下标。您还可以定义在类型本身上调用的下标。这种下标称为类型下标。**可以subscript关键字之前写入关键字static。**

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
```
# 继承Inheritance
一个类可以从另一个类继承方法，属性和其他特征。当一个类从另一个类继承时，继承的类称为子类，而其继承的类称为其超类。
## 基类Base Class
任何不从其他类继承的类都称为基类。

```swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()

print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour
```
## 子类Subclass
子类化是在现有类的基础上建立新类的行为。子类继承现有类的特征，然后可以对其进行优化。还可以向子类添加新特征。

```swift
class SomeSubclass: SomeSuperclass {  // 在超类名称之前写上子类名称
    // subclass definition goes here
}
```
```swift
class Bicycle: Vehicle {
    var hasBasket = false // Bicycle类定义的新属性
}
bicycle.currentSpeed = 15.0  // 修改属性
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour


class Tandem: Bicycle {  // 子类本省还可以继续子类化
    var currentNumberOfPassengers = 0
}let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour
```
## Overriding
子类可以提供其自己的实例方法，类型方法，实例属性，类型属性或下标的自定义实现，否则该实例方法将从超类继承。这称为覆盖。要覆盖原本会被继承的特征，在覆盖定义的前面加上override关键字。

```swift
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
// Prints "Choo Choo"
```
通过在子类属性重写中同时提供getter和setter，可以将继承的只读属性呈现为读写属性。但不能将继承的读写属性表示为只读属性，如果在属性替代中提供了一个setter，则还必须为该替代提供一个getter。
### Overriding Property Observers
您可以使用属性覆盖将属性观察器添加到继承的属性。这使您可以在继承属性的值更改时得到通知。
不能将属性观察器添加到继承的常量存储属性或继承的只读计算属性。这些属性的值无法设置，因此不建议提供willSet或didSet实现作为替代的一部分。

```swift
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4
```

## 防止被Override
可以通过将方法，属性或下标标记为final来防止其被覆盖，如`final var, final func, final class func, final subscript`

# Initialization
初始化是准备使用的类，结构或枚举实例的过程。Swift初始化程序不会返回值。它们的主要作用是确保在首次使用类型之前，正确初始化类型的新实例。
## 设置存储属性的初始值
class和struct必须在创建该class或者struct的实例时将其所有存储的属性设置为适当的初始值。存储的属性不能处于不确定状态。
可以在初始化程序中为存储的属性设置初始值，或者通过将默认属性值分配为属性定义的一部分来设置初始值。
### 初始化器Initializers

```swift
init() {
    // perform some initialization here
}
```
### 默认属性值Default Property Values

```swift
struct Fahrenheit {
    var temperature = 32.0
}
```
## 自定义初始化
可以使用输入参数和可选属性类型，或通过在初始化过程中分配常量属性来自定义初始化过程。
### 初始化参数
初始化参数具有与function和method参数相同的功能和语法
```swift
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
```
### 参数名称和参数标签
function和method参数一样，初始化参数可以具有在初始化程序的主体内使用的参数名称和在调用初始化程序时使用的参数标签。但是，初始化程序在其括号前没有以function和method那样的方式标识函数的名称。因此，初始化器参数的名称和类型在确定应调用哪个初始化器中起着特别重要的作用。

```swift
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

let veryGreen = Color(0.0, 1.0, 0.0) // 调用时必须写标签
// this reports a compile-time error - argument labels are required
```
### 不带参数标签的初始化参数
如果不想为初始化参数使用参数标签，为替代显示参数标签，可以为该参数写下划线（_）

```swift
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)
// bodyTemperature.temperatureInCelsius is 37.0
```
### 可选属性类型
如果自定义类型的存储属性在逻辑上被允许为nil（可能是因为在初始化期间无法设置其值，或者因为稍后某个时候允许为nil），就需要设置为可选类型。可选类型的属性将使用值自动初始化nil。

```swift
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?" ，直到询问问题后，才能知道对调查问题的回答
cheeseQuestion.response = "Yes, I do like cheese."
```
### 在初始化期间分配常量属性
可以在初始化期间的任何时候为常量属性分配一个值，只要在初始化完成时将其设置为确定值即可。为常数属性分配值后，就无法再对其进行修改。
对于类实例，只能在引入常量的类的初始化期间对其进行修改。子类不能修改它。
## 默认初始化器
默认初始化程序仅创建一个新实例，并将其所有属性设置为其默认值。
```swift
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
```
### 结构类型的成员初始化器
与默认初始化程序不同，该结构即使在存储了没有默认值的属性的情况下，也会接收成员初始化程序。逐成员初始化器是初始化新结构实例的成员属性的简便方法。可以通过名称将新实例的属性的初始值传递给成员初始化器。

```swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// 调用成员初始化器时，可以忽略具有默认值的任何属性的值。
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
// Prints "0.0 2.0"

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)
// Prints "0.0 0.0"
```
## Initializer Delegation for Value Types
初始化程序可以调用其他初始化程序来执行实例初始化的一部分。此过程称为初始化程序delegation ，可避免在多个初始化程序之间重复代码。

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)
```
## 类继承和初始化
在初始化期间，必须为类的所有存储属性（包括该类从其超类继承的所有属性）分配一个初始值。
### 指定的初始化程序和便利性初始化程序
**指定的初始化程序将完全初始化该类引入的所有属性，并调用适当的超类初始化程序以继续超类链中的初始化过程。**
每个类必须至少有一个指定的初始化程序。在某些情况下，可以通过从超类继承一个或多个指定的初始化程序来满足此要求。

便利的初始值设定项是辅助的，支持类的初始值设定项。可以定义一个便捷初始化程序，以从与便捷初始化程序相同的类中调用一个指定初始化程序，并将某些指定初始值设定项的参数设置为默认值。您还可以定义一个便捷初始化程序，以针对特定用例或输入值类型创建该类的实例。

### 指定和便捷初始化程序的语法
指定的类初始化器的编写方式与值类型的简单初始化器的编写方式相同：

```swift
init(parameters) {
    statements
}
```

便捷初始化程序将convenience修饰符放在init关键字之前，并用空格分隔：

```swift
convenience init(parameters) {
    statements
}
```
### 类类型的初始化程序委托
为了简化指定初始化器和便捷初始化器之间的关系，Swift将以下三个规则应用于初始化器之间的委托delegation 调用：
**规则1**指定的初始值设定项必须从其直接超类调用指定的初始值设定项。
**规则2**便捷初始化程序必须从同一类调用另一个初始化程序。
**规则3**便利初始化程序必须最终调用指定的初始化程序。

- 指定的初始值必须始终delegate up。
- 便利的初始化必须始终delegate across。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714205951960.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
### 两阶段初始化（待研究）
Swift中的类初始化是一个分为两个阶段的过程。在第一阶段，每个存储的属性都由引入它的类分配一个初始值。一旦确定了每个存储属性的初始状态，便开始第二阶段，并且在认为新实例可以使用之前，每个类都有机会自定义其存储属性。
两阶段初始化过程的使用使初始化安全，同时仍为类层次结构中的每个类提供了完全的灵活性。两阶段初始化可防止在初始化属性值之前对其进行访问，并防止其他初始化程序意外地将属性值设置为其他值。

Swift的编译器执行四项有用的安全检查，以确保两阶段初始化完成且没有错误，这里就不展开说四项安全检查和两个阶段了。
### 初始化程序的继承和覆盖
Swift子类默认情况下不会继承其超类初始化程序。
如果希望自定义子类提供一个或多个与其父类相同的初始化器，则可以在子类中提供这些初始化器的自定义实现。
当编写与超类指定的初始化程序匹配的子类初始化程序时，实际上是在提供该指定的初始化程序的替代。因此，必须在子类的初始化程序定义之前加override修饰符。

```swift
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)


class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver
```
### 自动初始化程序继承
**默认情况下，子类不继承其超类初始化程序。但是，如果满足某些条件，则会自动继承超类初始化器。**
假设为子类中引入的任何新属性提供默认值，则适用以下两个规则：
**规则1**如果您的子类没有定义任何指定的初始化器，它将自动继承其所有超类的指定初始化器。
**规则2**如果您的子类提供了其所有超类指定初始化器的实现（通过按规则1继承它们，或通过提供自定义实现作为其定义的一部分），那么它将自动继承所有超类便利性初始化器。

即使您的子类添加了进一步的便利初始化程序，这些规则也适用。
### 指定的便捷初始化器
以下示例显示了实际的指定初始化器，便捷初始化器和自动初始化器继承。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714213330385.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
```swift
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714213520579.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200714213623663.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
```swift
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘
```

## 初始化失败
无效的初始化参数值，缺少必需的外部资源或其他阻止初始化成功的条件可能触发此失败。在init关键字（init?）后面放置问号，可以编写失败的初始化程序。

```swift
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe"

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
// Prints "The anonymous creature could not be initialized"
```
### 枚举失败的初始化程序
您可以使用故障初始化程序基于一个或多个参数来选择适当的枚举用例。如果提供的参数与适当的枚举情况不匹配，则初始化器可能会失败。

```swift
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// Prints "This is not a defined temperature unit, so initialization failed."
```
### 带有原始值的枚举失败的初始化程序
带有原始值的枚举会自动接收一个失败的初始化器，init?(rawValue:)该初始化器采用称为rawValue合适原始值类型的参数，并在找到匹配的枚举情况下选择匹配的枚举用例，如果不存在匹配的值则触发初始化失败。

```swift
enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// Prints "This is not a defined temperature unit, so initialization failed."
```
### 初始化失败的传播
class，struct或enum的故障初始化器可以委托同一class，struct或enum的另一个故障初始化器。类似地，子类可故障初始化器可以委托最多超类可故障初始化器。在任何一种情况下，如果委托给另一个导致初始化失败的初始化程序，则整个初始化过程将立即失败，并且不会执行其他初始化代码。

```swift
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"
```
### 覆盖失败的初始化程序
可以在子类中覆盖超类可失败的初始化程序，或可以使用子类不可失败的初始化程序来覆盖超类可失败的初始化程序。

```swift
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
```
### init!
可以定义一个初始化程序使用（init?）来创建适当类型的可选实例。还可以定义一个失败的初始化程序使用（init!），该初始化程序创建适当类型的隐式展开的可选实例。
可以从委托init?到init!，反之亦然；可以覆盖init?与init!，反之亦然；也可以从委托init到init!，但如果init!初始化初始化失败会引发一个断言。
## 必需的初始化器
指示该类的每个子类都必须实现该初始化器：

```swift
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
```

您还必须required在所需的初始化程序的每个子类实现之前编写修饰符，以指示初始化程序要求适用于链中的其他子类。override覆盖必需的指定初始值设定项时，您无需编写修饰符：

```swift
class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}
```
## 使用closure或function设置默认属性值
如果存储的属性的默认值需要一些自定义或设置，则可以使用闭包或全局函数为该属性提供自定义的默认值。每当初始化属性所属类型的新实例时，都会调用闭包或函数，并将其返回值分配为属性的默认值。

```swift
class SomeClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return someValue
    }()
}
```
闭包的末大括号后跟一对空括号。这告诉Swift立刻执行关闭。如果省略这些括号，则尝试将闭包本身分配给属性，而不是闭包的返回值。
如果使用闭包来初始化属性，则在执行闭包时实例的其余部分尚未初始化。这意味着无法从闭包内部访问任何其他属性值，即使这些属性具有默认值也是如此。也不能使用隐式self属性，也不能调用实例的任何方法。

```swift
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7))
// Prints "false"
```
# Deinitialization
当不再需要实例时，Swift会自动释放其实例，以释放资源。通常，在实例被释放后，无需执行手动清理。但是，当使用自己的资源时，可能需要自己执行一些额外的清理。如如果创建一个自定义类来打开文件并向其中写入一些数据，则可能需要在释放该类实例之前关闭该文件。

```swift
deinit {
    // perform the deinitialization
}
```
# Optional Chaining
可选链接是在调用可能为nil的properties, methods, and subscripts
## 可选链接作为强制展开的替代方法
您可以通过在要调用其properties, methods, and subscripts的可选值之后放置问号（?）来指定可选链。这非常类似于将感叹号（!）放在可选值之后以强制展开其值。

```swift
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
```
## 为Optional Chaining定义Model Classes
可以将可选链接与深度超过一级的属性，方法和下标一起使用。这使您可以深入研究相互关联类型的复杂模型中的子属性，并检查是否可以访问这些子属性上的属性，方法和下标。

```swift
class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
```
## 通过可选链接访问properties

```swift
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}
john.residence?.address = createAddress()
```
## 通过可选链接调用Methods

```swift
func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
}

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms."
```
## 通过可选链接访问subscripts
通过可选链访问可选值上的下标时，将问号放在下标的括号之前，而不是之后。可选链接问号总是紧接在表达式的可选部分之后。

```swift
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "Unable to retrieve the first room name."


john.residence?[0] = Room(name: "Bathroom")


let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."
```
访问可选类型的下标：如果下标返回的是可选类型的值，则在下标的右括号后面放置一个问号，以链接到其可选的返回值上：
```swift
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
```
## Linking Multiple Levels of Chaining
如果您尝试检索的类型不是可选的，则由于可选的链接，它将变为可选的。
如果你正在尝试检索类型是已经可选的，它不会变得更因为链接可选。
因此：

如果尝试吧一个Int值通过可选的链接检索值，则无论使用多少级链接，总是会返回Int?。
同样，如果您尝试Int?通过可选的链接检索值，则无论使用多少级链接，总是会返回Int?。

```swift
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "Unable to retrieve the address."


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "John's street name is Laurel Street."
```
## 链接具有可选返回值的Methods
前面的示例显示了如何通过可选链接检索可选类型的属性的值。还可以使用可选链接来调用返回可选类型值的方法，并根据需要链接该方法的返回值。

```swift
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// Prints "John's building identifier is The Larches."

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// Prints "John's building identifier begins with "The"."
```
要将可选链接问号放在括号后，因为要串联上可选的值是buildingIdentifier()方法的返回值，而不是buildingIdentifier()方法本身。

# Error Handling
错误处理是响应程序错误状态并从错误状态中恢复的过程。
## 表示和抛出错误

```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```
## 处理错误
要在代码中标识这些位置，请在一段调用可能引发错误的函数，方法或初始化程序的代码之前，写上try关键字（ try?或try!）
### 使用投掷函数传播错误：throws
标throws有的函数称为抛出函数。如果函数指定了返回类型，则throws在返回箭头（->）之前写入关键字。

```swift
func canThrowErrors() throws -> String
func cannotThrowErrors() -> String
```

```swift
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
```
## 使用Do-Catch处理错误
如果do子句中的代码引发错误，则将其与catch子句进行匹配以确定其中哪一个可以处理该错误。如果catch子句没有模式，则该子句匹配任何错误，并将错误绑定到名为的局部常量error。

```swift
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
// Prints "Insufficient funds. Please insert an additional 2 coins."
```
在nonthrowing函数中，do- catch语句必须处理该错误。在throwing函数中，do- catch语句或调用者都必须处理错误。

```swift
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
// Prints "Couldn't buy that from the vending machine."
```
多个捕获多个错误使用逗号隔开

```swift
func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
```
### 将错误转换为可选值：try?
可以try?通过将错误转换为可选值来处理错误。如果在评估try?表达式时抛出错误，则表达式的值为nil。

```swift
func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
```
可以使用try?编写简洁的错误处理代码

```swift
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
```
### 禁用错误传播：try!
在知道抛出函数或方法实际上不会在运行时抛出错时，可以在表达式之前编写try!以禁用错误传播，并将调用包装在不会引发任何错误的运行时断言中。如果实际抛出错误，将收到运行时错误。

```swift
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```
## 指定清理措施（待研究）
可以defer在代码执行离开当前代码块之前使用一条语句来执行一组语句。一条defer语句推迟执行，直到退出当前范围。该语句由defer关键字和以后要执行的语句组成。延迟的语句可能不包含任何将控制权移出该语句的代码，例如break或return语句，或throwing an error。延迟的操作以与代码中写入的顺序相反的顺序执行。也就是说，第一个defer语句中的代码最后执行，第二个defer语句中的代码倒数第二执行，依此类推。defer源代码顺序中的最后一条语句首先执行。

```swift
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}
```

# 类型转换
您可以将类型转换与类和子类的层次结构一起使用，以检查特定类实例的类型，并将该实例转换为相同层次结构中的另一个类。

```swift
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]
```
## 检查类型：is
使用类型检查运算符（is）检查实例是否属于某个子类类型。类型检查运算符将返回true实例是否属于该子类类型，false如果不是。

```swift
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// Prints "Media library contains 2 movies and 3 songs"
```
## Downcasting：as
某个类类型的常量或变量实际上可能是指幕后子类的实例。某个类类型的常量或变量实际上可能是指幕后子类的实例。如果您认为是这种情况，可以尝试使用类型转换运算符（as?或as!）将其转换为子类类型。
当您不确定向下转换是否成功时，请使用类型转换运算符（as?）的条件形式。这种形式的运算符将始终返回一个可选值，该值将在nil无法向下转换的情况下返回。这使您能够检查下调是否成功。
仅当您确定向下转换将始终成功时，才使用类型转换运算符（as!）的强制形式。如果您尝试向下转换为不正确的类类型，则此形式的运算符将触发运行时错误。

```swift
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

// Movie: Casablanca, dir. Michael Curtiz
// Song: Blue Suede Shoes, by Elvis Presley
// Movie: Citizen Kane, dir. Orson Welles
// Song: The One And Only, by Chesney Hawkes
// Song: Never Gonna Give You Up, by Rick Astley
```
## 类型转换为Any和AnyObject
- Any 可以代表任何类型的实例，包括函数类型。
- AnyObject 可以代表任何类类型的实例。

```swift
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael
```
Any类型表示任何类型的值，包括可选类型。如果您在Any期望使用类型值的情况下使用可选值，则Swift会警告您。如果确实需要使用可选值作为Any值，则可以使用as运算符将可选值显式转换为Any，如下所示。

```swift
let optionalNumber: Int? = 3
things.append(optionalNumber)        // Warning
things.append(optionalNumber as Any) // No warning
```
# 嵌套类型

```swift
struct BlackjackCard {

    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {  // enum Rank的嵌套结构
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
// Prints "theAceOfSpades: suit is ♠, value is 1 or 11"
```
Rank和Suit嵌套在其中BlackjackCard，它们的类型也可以从上下文中推断出来，因此，此实例的初始化能够仅通过其案例名称（.ace和.spades）来引用枚举案例。
## 引用嵌套类型（待研究）
要在其定义上下文之外使用嵌套类型，要为其名称钱加上所嵌套的类型名称的前缀：

```swift
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
// heartsSymbol is "♡"
```
# Extensions
扩展为现有的类，结构，枚举或协议类型添加了新功能。
- 添加计算实例属性和计算类型属性
- 定义实例方法和类型方法
- 提供新的初始化器
- 定义下标
- 定义和使用新的嵌套类型
- 使现有类型符合协议

```swift
extension SomeType {
    // new functionality to add to SomeType goes here
}
```
扩展可以扩展现有类型以使其采用一种或多种协议。要添加协议一致性，请使用与为类或结构编写协议名称相同的方式编写协议名称：
```swift
extension SomeType: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}
```
## 计算属性
扩展可以将计算的实例属性和计算的类型属性添加到现有类型。

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"
```
## Initializers
扩展可以向现有类型添加新的初始化器。这使您可以扩展其他类型，以接受自己的自定义类型作为初始化程序参数，或提供未包含在该类型的原始实现中的其他初始化选项。
扩展可以将新的便捷初始化程序添加到类，但是不能将新的指定初始化程序或反初始化程序添加到类。指定的初始化程序和反初始化程序必须始终由原始类实现提供。

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))
   
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
```
## Methods
扩展可以向现有类型添加新的实例方法和类型方法。

```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!
```
Mutating Instance Methods

```swift
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9
```
## Subscripts
扩展可以将新的下标添加到现有类型。

```swift
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7

746381295[9]
// returns 0, as if you had requested:
0746381295[9]
```
## 嵌套类型
扩展可以将新的嵌套类型添加到现有的类，结构和枚举中

```swift
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "
```
# Generics
通用代码使您可以编写灵活，可重用的函数和类型，这些函数和类型可以根据您定义的要求与任何类型一起使用。如Swift Array和Dictionarytype都是通用集合。
## 通用函数
```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```
这里交换的两个值是Double或者String类型也是一样的功能，只要保证a和b的类型相同，所以可以使用Generic Functions

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoInts(_ a: inout Int, _ b: inout Int)
func swapTwoValues<T>(_ a: inout T, _ b: inout T)

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"
```
## 类型参数
在swapTwoValues(_:_:)上面的示例中，占位符类型T是type参数的示例。类型参数指定并命名一个占位符类型，并在函数名称后立即写入一对匹配的尖括号（例如<T>）之间。在每种情况下，每当调用函数时，type参数都将替换为实际类型。通过在尖括号中用逗号分隔多个类型参数名称，可以提供多个类型参数。
## 通用类型
可以定义自己的通用类型。这些是可以与任何类型一起使用的自定义类，结构和枚举，类似于Array和的方式Dictionary。

```swift
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 改成通用类型的，<Element>占位
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings
```
## 扩展通用类型

```swift
// 返回堆栈上的顶层项目，而不将其从堆栈中弹出
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
// Prints "The top item on the stack is tres."
```
## 类型约束
类型约束指定类型参数必须从特定的类继承，或符合特定的协议或协议组成。
如字典键的类型必须是可哈希的。此要求是由的键类型上的类型约束强制执行的，该约束Dictionary指定键类型必须符合Hashable协议。

通过将单个类或协议约束放在类型参数名称后（用冒号分隔）作为类型参数列表的一部分来编写类型约束。

```swift
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
// 第一个类型参数T的类型约束必须T为的子类SomeClass。第二种类型的参数U具有类型约束，该约束要求U符合协议SomeProtocol。
```
## Action中的类型约束

```swift
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
```
这样写是有问题的在尝试编译的时候会报错，问题在于相等性检查，并非Swift中的每种类型都可以与等于运算符（==）进行比较。但Swift的所有标准类型都自动支持该Equatable协议。
所以可以将类型约束写入作为类型参数定义的一部分：

```swift
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2
```
## 关联类型
### 实际中的关联类型（待研究）
该Container协议定义了任何容器必须提供的三个必需功能：

- 必须有可能使用方法将新项目添加到容器中append(_:)。
- 必须有可能通过count返回Int值的属性来访问容器中的项目计数。
- 必须有可能使用带有Int索引值的下标检索容器中的每个项目。
```swift
// 协议Container声明了一个关联类型Item
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```
该协议未指定容器中各项的存储方式或允许的类型。该协议仅指定任何类型必须提供的三个功能才能被视为a Container。只要符合这三个要求，符合类型就可以提供其他功能。

这里的非泛型的IntStack类型符合Container协议，该IntStack类型实现了Container协议的所有三个要求，并且在每种情况下都包装了该IntStack类型的现有功能的一部分，以满足这些要求。
```swift
struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
```
还可以使泛型Stack类型符合Container协议：

```swift
struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
```
### 扩展现有类型以指定关联类型
Swift的Array类型已经提供了一个append(_:)方法，一个count属性和一个带有Int索引的下标来检索其元素。这三种功能符合Container协议的要求。这意味着您可以简单地通过声明采用该协议来扩展Array以符合该协议。

```swift
extension Array: Container {}
```
### 将约束添加到关联类型
可以将类型约束添加到协议中的关联类型，以要求符合条件的类型满足这些约束。

```swift
protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```
### 在关联类型的约束中使用协议（待研究）
协议可以作为其自身要求的一部分出现。

```swift
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}
var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
// suffix contains 20 and 30

extension IntStack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack<Int> {
        var result = Stack<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack<Int>.
}
```
## 通用条款：where
通用where子句可以要求关联类型必须符合特定协议，或者某些类型参数和关联类型必须相同。型where子句以where关键字开头，后跟关联类型的约束或类型与关联类型之间的相等关系。where可以在类型或函数的主体的大括号前写一个通用子句。

```swift
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}
```

## 具有通用Where子句的扩展
也可以将通用where子句用作扩展的一部分。

```swift
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
```
## 上下文相关条款
where当您已经在泛型类型的上下文中工作时，可以将泛型子句作为声明的一部分编写，该声明没有自己的泛型类型约束。

```swift
extension Container {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
    func endsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[count-1] == item
    }
}
let numbers = [1260, 1200, 98, 37]
print(numbers.average())
// Prints "648.75"
print(numbers.endsWith(37))
// Prints "true"
```
## 具有通用Where子句的关联类型
可以where在关联的类型上包括通用子句。如要制作一个Container包含迭代器的版本，如Sequence协议在标准库中使用的那样。这是您的写法：

```swift
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
```
## 通用下标
下标可以是通用的，并且可以包含通用where子句。在subscript后的尖括号内写占位符类型名称，并在下标正文的左花括号前写一个where通用子句。例如：

```swift
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
```


# Opaque Types
返回值类型不透明的函数或方法将隐藏其返回值的类型信息。

```swift
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())
// *
// **
// ***

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())
// ***
// **
// *

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *
```

## 返回Opaque Types（待研究）
可以认为不透明类型就像是通用类型的逆向。具有不透明返回类型的函数必须仅返回单个类型的值。

```swift
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())
// *
// **
// **
// **
// **
// *

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *

func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
    if shape is Square {
        return shape // Error: return types don't match
    }
    return FlippedShape(shape: shape) // Error: return types don't match
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
```
## Opaque Types 和 Protocol Types的区别
返回不透明类型看起来与使用协议类型作为函数的返回类型非常相似，但是这两种返回类型在是否保留类型标识方面有所不同。不透明类型是指一种特定的类型，尽管函数的调用者无法看到哪种类型。协议类型可以指符合协议的
# Automatic Reference Counting
Swift使用自动引用计数（ARC）来跟踪和管理应用程序的内存使用情况。
## ARC如何运作
每次创建类的新实例时，ARC都会分配一块内存来存储有关该实例的信息。该内存保存有关实例类型的信息，以及与该实例关联的所有存储属性的值。当不再需要某个实例时，ARC会释放该实例使用的内存，以便该内存可用于其他目的。这样可以确保不再需要类实例时，它们不会占用内存空间。

```swift
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
// Prints "John Appleseed is being initialized"

reference2 = reference1
reference3 = reference1

// 如果通过分配nil两个变量来破坏其中两个强引用（包括原始引用），Person则会保留一个强引用，并且不会释放该实例
reference1 = nil
reference2 = nil

// Person直到第三个也是最后一个强引用被破坏，ARC才会取消分配实例，这时很明显您不再使用该Person实例
reference3 = nil
// Prints "John Appleseed is being deinitialized"
```
## 类实例之间的strong reference cycle
如果两个类实例相互之间有很强的引用，从而使每个实例使另一个实例保持活动状态，则可能发生这种情况。这被称为strong reference cycle。可以通过将类之间的某些关系定义为弱引用或无主引用而不是强引用，可以解决强引用循环问题。
```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200715224520975.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
john!.apartment = unit4A
unit4A!.tenant = john
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200715224528138.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
// Person实例与Apartment实例之间的强引用将保留并且不能被破坏。
john = nil
unit4A = nil
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200715224541378.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 解决类实例之间的强引用循环
### Weak References
将weak关键字放在属性或变量声明之前。因为弱引用不能完全保持它所引用的实例，所以有可能在弱引用仍在引用该实例时将其释放。因此，ARC会自动为nil它所引用的实例被释放时设置一个弱引用。而且，由于弱引用需要允许nil在运行时将其值更改为，因此它们始终被声明为可选类型的变量，而不是常量。

```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200715224552964.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
john = nil
// Prints "John Appleseed is being deinitialized"
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200715224642832.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
### Unowned References
将unowned关键字放在属性或变量声明之前来指示Unowned References。

```swift
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

let department = Department(name: "Horticulture")

let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716151656503.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
### Unowned References和隐式展开的可选属性

```swift
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"
```
在上面的示例中，使用隐式解包的可选意味着所有两阶段类初始化器要求都得到满足。capitalCity一旦初始化完成，就可以像使用非可选值一样使用和访问该属性，同时仍然避免了强引用周期。
## Closures的Strong Reference Cycles（待深究）
如果将闭包分配给类实例的属性，并且闭包的主体捕获该实例，则也会发生强引用循环。之所以会发生这种捕获，是因为闭包的主体访问实例的属性，例如self.someProperty，或者因为闭包在实例上调用了一个方法，例如self.someMethod()。无论哪种情况，这些访问都会导致闭包被“捕获” self，从而创建了一个强大的参考周期。
之所以会发生这种强烈的引用循环，是因为闭包（比如class）是引用类型。将闭包分配给属性时，就是在分配对该闭包的引用。本质上还是两个强引用使彼此保持生命。但是，这次不是两个class实例，而是一个使彼此保持活动状态的class实例和一个closure。
Swift使用closure capture list解决这个问题。

```swift
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    // 仅当元素实际需要以某种HTML输出目标的字符串值形式呈现时，才需要属性asHTML

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716153214611.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
属性asHTML指向closure是strong reference ，由于closure指向它里面的self（如self.name和self.text）也是strong reference，所以产生了strong reference cycle。
## 解决Closures的Strong Reference Cycles（待深究）
### 定义捕获列表
捕获列表中的每一项都是将weak或unowned关键字与对类实例的引用（例如self）或用某个值初始化的变量（例如delegate = self.delegate）配对。这些配对写在一对方括号内，并用逗号分隔。

```swift
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate]
    (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}

// 如果闭包没有指定参数列表或返回类型（因为可以从上下文中推断出它们），将捕获列表放在闭包的最开始，然后是in关键字：
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate] in
    // closure body goes here
}
```
### Weak and Unowned References
当闭包及其捕获的实例始终相互引用且始终在同一时间解除分配时，将闭包中的捕获定义为unowned reference。
相反，当捕获的参考nil将来可能成为某个点时，将捕获定义为weak reference。弱引用始终是可选类型，并且nil在释放它们引用的实例时会自动变为弱引用。
如果捕获的引用永远不会成为nil，则应始终将其捕获为unowned reference，而不是weak reference。

```swift
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil
// Prints "p is being deinitialized"
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716155950699.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
# Memory Safety
默认情况下，Swift防止代码中发生不安全行为。例如，Swift确保在使用变量之前先对其进行初始化，在释放变量后不访问内存，并检查数组索引是否存在越界错误。大多数时候不需要考虑访问内存，但要了解在何处可能发生冲突，来避免编写对内存的访问有冲突的代码。

在冲突的访问环境中要考虑内存访问的三个特征：访问是读还是写，访问的持续时间以及要访问的内存位置。
- 至少一个是写访问权限。
- 它们访问内存中的相同位置。
- 它们的持续时间重叠。

读和写访问之间的区别通常很明显：写访问会更改内存中的位置，但读访问不会。内存中的位置是指所访问的内容，例如，变量，常量或属性。内存访问的持续时间是瞬时的或长期的。如果在访问开始之后但结束之前不可能运行其他代码，则访问是瞬时的。从本质上讲，两个瞬时访问不能同时发生。大多数内存访问是瞬时的。
## 对In-Out参数的访问冲突
函数可以对其所有In-Out参数进行长期写访问。在对所有非In-Out参数进行评估之后，将开始对In-Out参数进行写访问，并持续该函数调用的整个过程。如果有多个In-Out参数，则写入访问的开始顺序与参数出现的顺序相同。
这种长期写访问的结果是，即使作用域规则和访问控制允许这样做，您也无法访问以in-out形式传递的原始变量-对原始文件的任何访问都会产生冲突。例如：
```swift
var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

increment(&stepSize)
// Error: conflicting accesses to stepSize
```
对stepSize的读取访问与对的number写入访问重叠，所以报错
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716181215558.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
解决此冲突的一种方法是显式复制stepSize：

```swift
// Make an explicit copy.
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

// Update the original.
stepSize = copyOfStepSize
// stepSize is now 2
```

长期对in-out参数进行写访问的另一个结果是，将单个变量作为同一函数的多个in-out参数的参数传递会产生冲突。例如：

```swift
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK
balance(&playerOneScore, &playerOneScore)
// Error: conflicting accesses to playerOneScore
```
用playerOneScore和playerTwoScore作为参数调用不会产生冲突，这时有两个时间重叠的写访问，但是它们访问内存中的不同位置。相反，传递两个playerOneScore参数的值会产生冲突，因为它试图同时对内存中的同一位置执行两次写访问。

由于运算符是函数，因此他们也可以长期访问其输入输出参数。例如，如果`balance(_:_:)`是一个名为的运算符`<^>`，则写入`playerOneScore <^> playerOneScore`将导致与`balance(&playerOneScore, &playerOneScore)`相同的冲突。
## Methods中的self获取冲突

```swift
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // OK
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716182123638.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
oscar.shareHealth(with: &oscar)
// Error: conflicting accesses to oscar
```
mutation方法需要self在该方法的持续时间内进行写访问，而in-out参数需要teammate在相同的持续时间内进行写访问。在该方法中，两个self和都teammate指向内存中的同一位置-如下图所示。这两个写访问引用相同的内存，并且它们重叠，从而产生冲突。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200716182146613.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 访问属性冲突
诸如结构，元组和枚举之类的类型由各个组成值组成，例如结构的属性或元组的元素。因为这些是值类型，所以对值的任何部分进行更改都会对整个值进行更改，这意味着对属性之一的读或写访问要求对整个值的读或写访问。例如，对元组元素的重叠写访问会产生冲突：

```swift
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
// Error: conflicting access to properties of playerInformation
```
下面的代码显示，对存储在全局变量中的结构的属性进行重叠的写访问时，会出现相同的错误。

```swift
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)  // Error
```

实际上，对结构属性的大多数访问都可以安全地重叠。例如，如果将holly上面示例中的变量更改为局部变量而不是全局变量，则编译器可以证明对结构的存储属性的重叠访问是安全的：

```swift
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // OK
}
```
保留内存安全性并非始终需要限制对结构属性的重叠访问。内存安全是理想的保证，但是独占访问是比内存安全更严格的要求-这意味着即使某些代码违反了对内存的独占访问，某些代码仍可以保留内存安全。如果编译器可以证明对内存的非独占访问仍然是安全的，则Swift允许使用此内存安全代码。具体来说，如果满足以下条件，则可以证明重叠访问结构的属性是安全的：

- 仅访问实例的存储属性，而不访问计算的属性或类属性。
- 结构是局部变量的值，而不是全局变量的值。
- 该结构要么没有被任何闭包捕获，要么仅被不冒号的闭包捕获。

如果编译器无法证明访问是安全的，则它不允许访问。

# Access Control
## 模块和源文件
Swift的访问控制模型基于模块和源文件的概念。
## 五种访问级别
从上到下逐渐增加访问限制，open access是最高的访问级别，是最低限制
- open access和public access使实体可以在其定义模块的任何源文件中使用，也可以在导入定义模块的另一个模块的源文件中使用。指定框架的公共接口时，通常使用开放或公共访问权限。开放和公共访问之间的区别如下所述。
- Internal access使实体可以在其定义模块的任何源文件中使用，但不能在该模块外部的任何源文件中使用。在定义应用程序或框架的内部结构时，通常使用内部访问。
- file-private access将实体的使用限制为自己定义的源文件。当在整个文件中使用特定功能的实现细节时，使用文件专用访问权限可以隐藏这些细节。
- private access将实体的使用限制为封闭的声明以及同一文件中该声明的扩展名。仅在单个声明中使用特定功能的实现细节时，请使用私有访问权限来隐藏这些细节。
- 
**默认访问级别**
如果=未指定显式访问级别，则代码中的所有实体（有一些特定的例外）都具有默认的内部访问级别。

**Single-Target Apps的访问级别**
Single-Target Apps，应用程序中的代码通常是独立包含在应用程序内的，不需要在应用程序模块之外使用。内部的默认访问级别已经符合此要求。因此，您无需指定自定义访问级别。但是，您可能希望将代码的某些部分标记为私有文件或私有文件，以便在应用程序模块中的其他代码中隐藏其实现详细信息。

**框架的访问级别**
开发框架时，请将该框架的面向公众的接口标记为开放或公开，以便其他模块可以查看和访问它。此面向公众的接口是框架的应用程序编程接口（或API）。

**Unit Test Targets的访问级别**
Unit Test Targets，需要使该应用程序中的代码可用于该模块才能进行测试。默认情况下，其他模块只能访问标记为开放或公开的实体。但是，如果使用@testable属性标记产品模块的导入声明并在启用测试的情况下编译该产品模块，则单元测试目标可以访问任何内部实体。

## 访问控制语法
关键字open，public，internal，fileprivate，private。除非另有说明，否则默认访问级别是内部的。
```swift
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


class SomeInternalClass {}              // implicitly internal
let someInternalConstant = 0            // implicitly internal
```
## 各种类型
**自定义类型**
如果要为自定义类型指定显式访问级别，请在定义类型时执行此操作。然后，只要访问级别允许，就可以使用新类型。例如，如果定义了文件专用类，则该类只能在定义了文件专用类的源文件中用作属性的类型，或用作函数参数或返回类型。
类型的访问控制级别也会影响该类型的成员（属性，方法，初始化程序和下标）的默认访问级别。如果将类型的访问级别定义为私有或文件私有，则其成员的默认访问级别也将为私有或文件私有。如果将类型的访问级别定义为内部访问或公共访问（或使用内部访问的默认访问级别，而未明确指定访问级别），则类型成员的默认访问级别将是内部的。

```swift
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}
```
**元组类型**
元组类型的访问级别是该元组中使用的所有类型中限制性最强的访问级别。例如，如果您由两种不同的类型组成一个元组，一种具有内部访问权，另一种具有私有访问权，则该复合元组类型的访问级别将是私有的。
元组类型没有类，结构，枚举和函数那样的独立定义。元组类型的访问级别是由构成元组类型的类型自动确定的，因此无法明确指定。

**function类型**
函数类型的访问级别被计算为函数的参数类型和返回类型中限制性最强的访问级别。如果函数的计算访问级别与上下文默认值不匹配，则必须明确指定访问级别作为函数定义的一部分。

因为该函数的返回类型是私有的，所以必须使用private修饰符标记该函数的整体访问级别，以使该函数声明有效：

```swift
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}
```

someFunction()用public或internal修饰符标记的定义或使用internal的默认设置是无效的，因为该函数的公共或内部用户可能无法适当地访问该函数的返回类型中使用的私有类。

**枚举类型**
枚举的个别情况将自动获得与其所属的枚举相同的访问级别。您能为单个枚举案例指定其他访问级别。

在下面的示例中，CompassPoint枚举具有显式的public访问级别。枚举的情况下north，south，east，和west因此也有公共的访问级别：

```swift
public enum CompassPoint {
    case north
    case south
    case east
    case west
}
```

**原始值和关联值**
枚举定义中用于任何原始值或关联值的类型的访问级别必须至少与枚举的访问级别一样高。例如，您不能将私有类型用作具有内部访问级别的枚举的原始值类型。

**嵌套类型**
嵌套类型的访问级别与其包含类型相同，除非包含类型是公共的。在公共类型内定义的嵌套类型具有内部的自动访问级别。如果要使公共类型中的嵌套类型可公开使用，则必须将嵌套类型显式声明为public。
## Subclassing
可以将在当前访问上下文中可以访问的，与该子类在同一模块中定义的任何类作为子类。还可以将在不同模块中定义的任何开放类作为子类。子类不能具有比其父类更高的访问级别-例如，不能编写内部父类的公共子类。

此外，对于在同一模块中定义的类，您可以覆盖在特定访问上下文中可见的任何类成员（方法，属性，初始化程序或下标）。对于在另一个模块中定义的类，可以覆盖任何打开的类成员。

```swift
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}
```

子类成员调用访问权限比子类成员低的超类成员甚至是有效的，只要对超类成员的调用发生在允许的访问级别上下文内（即，与文件私有成员调用的超类，或与内部成员调用的超类在同一模块内）：

```swift
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}
```
## Constants, Variables, Properties, and Subscripts
常量，变量或属性不能比其类型更公开。例如，用私有类型编写公共属性是无效的。同样，下标不能比其索引类型或返回类型更公开。
如果常量，变量，属性或下标使用私有类型，则常量，变量，属性或下标也必须标记为private：

```swift
private var privateInstance = SomePrivateClass()
```
**Getters and Setters**
常量，变量，属性和下标的Getters and Setters将自动获得与其所属的常量，变量，属性或下标相同的访问级别。您可以为setter提供比其相应的getter 更低的访问级别，以限制该变量，属性或下标的读写范围。
## Initializers
初始化程序参数的类型不能比初始化程序自己的访问级别更私有。
**默认初始化器**
如Default Initializers中所述，Swift自动为所有结构或基类提供默认初始化器，而没有任何参数，该结构或基类为其所有属性提供默认值，并且自身不提供至少一个初始化器。

默认初始化程序具有与其初始化类型相同的访问级别，除非该类型定义为public。对于定义为的类型，public默认初始化器被认为是内部的。如果要在另一个模块中使用某个公共参数时使用无参数初始化器来对其进行初始化，则必须自己明确地提供一个公共无参数初始化器作为类型定义的一部分。

**Structure Types的默认成员级初始化器**
如果结构的任何存储属性是私有的，则该结构类型的默认成员初始化器被认为是私有的。同样，如果结构的任何存储属性是文件专用的，则初始化程序是文件专用的。否则，初始化程序的访问级别为internal。

与上面的默认初始化程序一样，如果希望在另一个模块中使用公用结构初始化程序初始化成员结构的公共结构类型时，则必须自己提供公用成员初始化程序作为该类型定义的一部分。
## Protocols
如果要为协议类型分配显式访问级别，请在定义协议时进行。这使您能够创建只能在特定访问上下文中采用的协议。

协议定义中每个需求的访问级别会自动设置为与协议相同的访问级别。您不能将协议要求设置为与其支持的协议不同的访问级别。这样可以确保所有协议要求在采用该协议的任何类型上都是可见的。


如果定义公共协议，则协议的要求在实施时就需要这些要求的公共访问级别。此行为不同于其他类型，在其他类型中，公共类型定义表示该类型成员的内部访问级别。

**协议继承**
如果定义从现有协议继承的新协议，则新协议最多可以具有与其继承的协议相同的访问级别。例如，您不能编写从内部协议继承的公共协议。

**协议一致性**
一种类型可以符合一种协议，该协议具有比该类型本身更低的访问级别。例如，您可以定义可以在其他模块中使用的公共类型，但是其与内部协议的一致性只能在内部协议的定义模块中使用。

类型符合特定协议的上下文是该类型的访问级别和协议的访问级别中的最小值。例如，如果某个类型是公共的，但其遵循的协议是内部的，则该类型对该协议的符合性也是内部的。

在编写或扩展类型以符合协议时，必须确保每种协议要求的类型实现至少具有与该协议所遵循的类型相同的访问级别。例如，如果公共类型符合内部协议，则每个协议要求的类型实现必须至少是内部的。

## Extensions
您可以在类，结构或枚举可用的任何访问上下文中扩展类，结构或枚举。在扩展中添加的任何类型成员都具有与在要扩展的原始类型中声明的类型成员相同的默认访问级别。如果扩展公共或内部类型，则添加的任何新类型成员的默认访问级别为内部。如果扩展文件专用类型，则添加的任何新类型成员都具有文件专用的默认访问级别。如果扩展私有类型，则添加的任何新类型成员的默认访问级别均为私有。

另外，您可以使用显式访问级别修饰符（例如private）标记扩展，以为扩展中定义的所有成员设置新的默认访问级别。对于单个类型成员，仍可以在扩展名中覆盖此新的默认值。

如果您使用扩展名添加协议一致性，则不能为该扩展名提供明确的访问级别修饰符。相反，协议本身的访问级别用于为扩展内的每个协议要求实现提供默认访问级别。

**扩展中的私人成员**
与扩展类，结构或枚举位于同一文件中的扩展的行为就像扩展中的代码已被编写为原始类型声明的一部分一样。因此，您可以：

在原始声明中声明一个私有成员，然后从同一文件的扩展名访问该成员。
在一个扩展名中声明一个私有成员，并从同一文件的另一个扩展名访问该成员。
在扩展名中声明一个私有成员，然后从同一文件中的原始声明访问该成员。
此行为意味着您可以以相同的方式使用扩展来组织代码，无论您的类型是否具有私有实体。例如，给出以下简单协议：

```swift
protocol SomeProtocol {
    func doSomething()
}
```

您可以使用扩展来添加协议一致性，如下所示：

```swift
struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}
```

## Generics
通用类型或通用函数的访问级别是通用类型或函数本身的访问级别以及对其类型参数的任何类型约束的访问级别的最小值。

## Type Aliases
出于访问控制的目的，您定义的任何类型别名都被视为不同的类型。类型别名的访问级别可以小于或等于其别名的访问级别。例如，私有类型别名可以为私有，文件私有，内部，公共或开放类型别名，但是公共类型别名不能为内部，文件私有或私有类型别名。

此规则也适用于用于满足协议一致性的关联类型的类型别名。

# 高级操作符Advanced Operators
Swift还提供了一些高级运算符，它们执行更复杂的值操作。包括按位和移位运算符。
不仅限于预定义的运算符。Swift使您可以自由定义自己的自定义中缀，前缀，后缀和赋值运算符，以及自定义优先级和关联性值。这些运算符可以像任何预定义的运算符一样在您的代码中使用和采用，您甚至可以扩展现有类型以支持您定义的自定义运算符。
## 按位运算符
按位运算符使您可以操纵数据结构中的各个原始数据位。它们通常用于低级编程中，例如图形编程和设备驱动程序创建。当您使用来自外部源的原始数据（例如，编码和解码数据以通过自定义协议进行通信）时，按位运算符也很有用。
**按位取反运算符（~）反转数所有位**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172152636.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000
```
**按位与运算符（&）**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172227660.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
```
**按位或运算符（|）**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172559838.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
```
**按位异或运算符（ ^）**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172628565.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001
```
**按位左移（<<）和右移（>>）运算符**，按位左移和右移具有将整数乘以或除以2的作用。将整数的位向左移一位将其值加倍，而将其向右移一位将其值减半。
**无符号整数的移位**
- 现有位向左或向右移动所请求的位数。
- 任何超出整数存储范围的位都将被丢弃。
- 在将原始位向左或向右移动之后，在后面的空格中插入零。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172754202.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)

```swift
let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153
```
**有符号整数的移位**
有符号整数使用其第一位（称为符号位）来指示整数是正数还是负数。符号位0表示正，符号位1表示负。其余位（称为值位）存储实际值。![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718172850771.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718173054645.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020071817305927.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 溢出运算符
Swift提供了三种算术溢出运算符，它们选择对整数计算进行溢出运算。这些运算符都以“＆”号开头&：
- 溢流加法（&+）
- 溢出减法（&-）
- 溢出乘法（&*）

### 值溢出
数字可以在正方向和负方向上溢出。
**使用溢出加法运算符（&+）**
```swift
// 使用溢出加法运算符（&+）允许无符号整数沿正方向溢出的示例：
var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718173248790.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
**使用溢出减法运算符（&-）**
```swift
var unsignedOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow is now equal to 255
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/202007181733135.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
有符号整数也会发生溢出。
```swift
var signedOverflow = Int8.min
// signedOverflow equals -128, which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1
// signedOverflow is now equal to 127
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718173428961.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
## 优先级和关联性
运算符优先级赋予某些运算符更高的优先级；这些运算符首先被应用。
运算符关联性定义了如何将具有相同优先级的运算符组合在一起-从左侧分组还是从右侧分组。可以将其理解为“他们与他们左侧的表情相关联”或“他们与他们右侧的表情相关联”。
在计算复合表达式的计算顺序时，考虑每个运算符的优先级和关联性很重要。例如，运算符优先级解释了为什么以下表达式等于17。

```swift
2 + 3 % 4 * 5
// this equals 17
```
## 运算符Methods
类和结构可以提供它们自己的现有运算符的实现。这称为使现有运算符超载。
以下示例显示了如何为自定义结构实现算术加法运算符（+）

```swift
// 矢量相加
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200718173946154.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1h1bkNpeQ==,size_16,color_FFFFFF,t_70)
### 前缀和后缀运算符
在关键字func之前编写prefixor或postfix修饰符来实现前缀或后缀一元运算符的Method

```swift
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

// 一元减运算符（-a）
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)
```
### 复合赋值运算符：+=等
复合赋值运算符将赋值（=）与另一个操作结合在一起，如加法赋值运算符（+=）

```swift
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original now has values of (4.0, 6.0)
```
### 等效运算符  ==、!=
默认情况下，自定义类和结构没有实现等效运算符，即等于运算符（==）和不等于运算符（!=）。通常，您可以实现运算符==，并使用标准库的默认运算符!=实现来抵消运算符==的结果。有两种实现操作符==的方式：可以自己实现，或者对于许多类型，可以要求Swift为综合实现。在这两种情况下，都将对标准库的Equatable协议添加一致性。

```swift
xtension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

// 使用此运算符检查两个Vector2D实例是否等效
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// Prints "These two vectors are equivalent."
```
## 自定义运算符
都是用operator的关键字，并且都有prefix, infix or postfix修饰

```swift
// 定义了一个名为+++的新前缀运算符
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

// 将Vector2D的x和y值加倍
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)
```
### 自定义中缀运算符的优先级
自定义中缀运算符每个都属于一个优先级组。优先级组指定一个运算符相对于其他中缀运算符的优先级，以及该运算符的关联性。
未明确放置在优先级组中的自定义中缀运算符将被赋予默认优先级组，其优先级立即高于三元条件运算符的优先级。
以下示例定义了一个名为的新的自定义中缀运算符+-，它属于优先级组AdditionPrecedence：

```swift
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
```
在定义前缀或后缀运算符时，您无需指定优先级。但是，如果将前缀和后缀运算符都应用于同一操作数，则将首先应用后缀运算符。