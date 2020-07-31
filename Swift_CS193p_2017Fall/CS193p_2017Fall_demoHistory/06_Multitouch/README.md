# lecture_6 Demo_PlayingCard 总结
## Demo Topics: PlayingCard
- Now that we have our PlayingCard Model, time to implement our Controller and View Creating a custom UIView subclass
Drawing with Core Graphics and UIBezierPath
UIView’s contentMode (i.e. redraw vs. scaling the bits on bounds change)
Drawing with transparency
More NSAttributedString dictionary keys ... UIFont and NSParagraphStyle
UIFontMetrics scaling for users who want larger fonts Managing subviews of your custom UIView
Using isHidden
CGAffineTransform
Constraint Priority
Assets.xcassets and drawing with UIImage
@IBDesignable and @IBInspectable
Using didSet to ensure redraws and relayouts when properties change

## M model模块
- **PalyingCard.swift**
    + 

- **PalyingCardDeck.swift**
    + 

## V view模块(storyboard)
- **Main.storyboard**
    + 添加一张牌的generic view，并将 Content Mode 设置为 Redraw
    + 把牌的背景调成透明的，勾选Opaque才能看到效果

- **PlayingCardView.swift**
    + 新建文件时选择 Cocoa Touch Class，因为 UIView 是 cocoa touch 或者 UI Kit 的 subclass
    + 试着画一个红色边框填充为绿色的圆
    和slides里的UIBezierPath例子略有不同，下面的代码绘制出来的是红色边框的圆，没有填充为绿色，是因为在context中画一个这样的strokePath，他会耗尽path，所以在`UIColor.green.setFill()`时没有path了要重新开始
    ```
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            context.setLineWidth(5.0)
            UIColor.green.setFill()
            UIColor.red.setStroke()
            context.strokePath()
            context.fillPath()
        }
    }
    ```
    接下来用UIBezierPath做更有优势，画出来的是一个红色边框绿色填充的圆
    ```
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = 5.0
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.stroke()
        path.fill()
    }
    ```
    但旋转屏幕后会出现变成椭圆的问题，因为默认情况下改变了view的bounds只缩放到新的大小，一般时候都不是想要的东西，所以要在 change bounds 的时候重新调用上面的代码，在storyboard里把将 Content Mode 设置为 Redraw就好了
    + 绘制扑克牌的牌面,圆角矩形背景，需要在storyboard里把背景调成透明的，勾选Opaque才能看到效果
    + 绘制右上角的数字+红桃
        * 适应系统设置里调整字体大小
        ```
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        ```
        虽然这里的rank、suit和model里的enum是不一样的，但controller负责翻译，view不管这些
        ```
        var rank: Int = 5 { didSet {setNeedsDisplay(); setNeedsLayout() } }
        var suit: String = "❤️" { didSet {setNeedsDisplay(); setNeedsLayout() } }
        var isFaceUp: Bool = true { didSet {setNeedsDisplay(); setNeedsLayout() } }
        ```
        * 对`PlayingCardView`进行extension，专门用来拜托蓝色的数字（各种值），让fontsize、radius等大小能更好的适应的不同的环境
        * 创建左上角和右下角的cornerLabel
        ```
        private lazy var upperLeftCornerLabel: UILabel = createCornerLabel()
        private lazy var lowerRightCornerLabel: UILabel = createCornerLabel()
        ```
        并进行设置样式
        ```
        private func configureCornerLabel(_ label: UILabel) {
            label.attributedText = cornerString
            label.frame.size = CGSize.zero
            label.sizeToFit()
            label.isHidden = !isFaceUp
        }
        ```
        左上角的还比较好办，因为在起始点的附近


## C controller模块
- **ViewController.swift**
    + 

## MyTips
- UIBezierPath
- NSAttributedString
- 