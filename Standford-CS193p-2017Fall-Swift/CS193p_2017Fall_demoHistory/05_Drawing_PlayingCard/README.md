# lecture_5 Demo_PlayingCard 总结
## Demo Topics: PlayingCard
- 建好一副扑克牌的model
- 控制台随机打印几张扑克牌

## M model模块
- **PalyingCard.swift**
    + 两个enum，一个实现扑克牌的花色，一个实现扑克牌的点数，并且存为array
    + `struct PlayingCard: CustomStringConvertible {}`增加protocol`CustomStringConvertible`优化控制台的打印格式，不会把所有详细内容都打印出来
    + 添加protocol`CustomStringConvertible`，需要添加`var description: String`
    `struct PlayingCard`里`var description: String { return "\(rank)\(suit)" }`
    `enum Suit`里`var description: String { return rawValue }`
    `enum Rank`里
    ```
    var description: String {
    switch self {
    case .ace: return "A"
    case .numeric(let pips): return String(pips)
    case .face(let kind): return kind
    }
    ```

- **PalyingCardDeck.swift**
    + 初始化一副牌 `init()`，4种花色，A,2-10,J,Q,K一共13中点数，共4*13张牌
    + 随机打印出牌 `mutating func draw()`，每打印一张就从数组里删掉一张以保证不重复

## V view模块(storyboard)
- **Main.storyboard**

## C controller模块
- **ViewController.swift**
    + 在控制台随机打印十张牌
    ```
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
    ```
    优化前
    ```
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.clubs, rank: PlayingCard.PlayingCard.Rank.face("K"))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.spades, rank: PlayingCard.PlayingCard.Rank.numeric(8))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.clubs, rank: PlayingCard.PlayingCard.Rank.numeric(8))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.diamonds, rank: PlayingCard.PlayingCard.Rank.numeric(10))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.diamonds, rank: PlayingCard.PlayingCard.Rank.numeric(8))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.hearts, rank: PlayingCard.PlayingCard.Rank.face("Q"))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.spades, rank: PlayingCard.PlayingCard.Rank.numeric(5))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.diamonds, rank: PlayingCard.PlayingCard.Rank.numeric(7))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.clubs, rank: PlayingCard.PlayingCard.Rank.numeric(10))
    PlayingCard(suit: PlayingCard.PlayingCard.Suit.spades, rank: PlayingCard.PlayingCard.Rank.ace)
    ```
    优化后
    ```
    5❤️
    9♣️
    9❤️
    7♣️
    9♦️
    K❤️
    Q❤️
    8♣️
    10♦️
    2❤️
    ```

## MyTips
- enum里用static var 存为array，方便调用allsuit和allrank的用法
- CustomStringConvertible，优化、控制控制台输出内容