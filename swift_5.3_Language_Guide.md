# swift 5.3 Language Guide
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
