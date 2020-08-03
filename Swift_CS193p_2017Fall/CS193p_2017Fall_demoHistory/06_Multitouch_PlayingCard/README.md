# lecture_6 Demo_PlayingCard 总结
## Demo Topics: PlayingCard
- Drawing with Core Graphics and UIBezierPath
- UIView’s contentMode (i.e. redraw vs. scaling the bits on bounds change)
- Drawing with transparency
- More NSAttributedString dictionary keys ... UIFont and NSParagraphStyle
- UIFontMetrics scaling for users who want larger fonts Managing subviews of your custom UIView
- Using isHidden
- CGAffineTransform
- Constraint Priority
- Assets.xcassets and drawing with UIImage
- @IBDesignable and @IBInspectable
- Using didSet to ensure redraws and relayouts when properties change

## M model模块
- **PalyingCard.swift**

- **PalyingCardDeck.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + 添加一张牌的generic view，并将 Content Mode 设置为 Redraw
    + 把牌的背景调成透明的，勾选Opaque才能看到效果
    + 将四个方向的constrain都改成>=20
    + control+drag建立constrain到自身，`Aspect Ratio` 固定长宽比，还需要固定宽度才可以达到效果，并且还要把width的优先级降低，这样当设置的宽度超过屏幕大小的时候他会尽可能的占满空间
    + 建立constrain把牌固定在屏幕中央
    + 加入 Tap Gesture Recognizer

- **Assets.xcassets**
    + 导入正面牌面image，包括J Q K
    + 导入反面牌面image

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
        ```
        // 在设置里调整了字体大小后redraw
        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            setNeedsDisplay()
            setNeedsLayout()
        }
        ```
        虽然这里的rank、suit和model里的enum是不一样的，但controller负责翻译，view不管这些，这边只是用来测试牌面显示的
        ```
        var rank: Int = 5 { didSet {setNeedsDisplay(); setNeedsLayout() } }
        var suit: String = "♥️" { didSet {setNeedsDisplay(); setNeedsLayout() } }
        var isFaceUp: Bool = true { didSet {setNeedsDisplay(); setNeedsLayout() } }
        ```
        这里三个var前面都加上`@IBInspectable`，就可以在storyboard的inspect里直接修改三个var的值来调试了
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
        特别注意这里`isHidden`的写法，方便进行牌面翻转
        * 左上角的还比较好办，因为在起始点的附近
        ```
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset) // offsetBy,cornerOffset都extension了
        ```
        * 右下角的要先定位到有下角的位置，然后偏移出一定间距，然后还要放下这个label的width*height大小的矩形
        ```
        configureCornerLabel(lowerRightCornerLabel)
        lowerRightCornerLabel.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi)
        lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY)
            .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
            .offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height)
        ```
        `rotated`2017年还是以原点（左上角）为旋转中心旋转，现在是以label的中心旋转了，所以不需要在旋转前先把label放到预定的位置这一步了
        `.translatedeBy(x: lowerRightCornerLabel.frame.size.width, y: lowerRightCornerLabel.frame.size.height)` 这步不需要了
    + 绘制正面牌面，
        * J Q K image牌面 `faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))`
        * 绘制1-10数字牌面 `drawPips()`
    + 绘制牌背面 `cardBackImage.draw(in: bounds)`
    + 在class前加上`@IBDesignable`可以在storyboard里预览效果，但image无法预览
    ```
    if let faceCardImage = UIImage(named: rankString+suit, in: Bundle(for: self.classForCoder), compatibleWith: traitCollection) {
        faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))
    }
    ```
    加上`in: Bundle(for: self.classForCoder), compatibleWith: traitCollection`让image也能在storyboard里面预览
    + 加入pinch Gesture,两指缩放牌面上的image
    ```
    var faceCardScale: CGFloat = SizeRatio.faceCardImageSizeToBoundsSize { didSet{ setNeedsDisplay() } }
    
    func adjustFaceCardScale(byHandlingGestureRecognizedBy recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended:
            faceCardScale *= recognizer.scale
            recognizer.scale = 1.0
        default:
            break
        }
    }
    ```


## C controller模块
- **ViewController.swift**
    + Gesture, 左右滑动切换牌
    ```
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    ```
    - Gesture, 轻点翻转牌面
    ```
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        playingCardView.isFaceUp != playingCardView.isFaceUp
    }
    ```
    - 缩放牌面图片
    ```
    let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
    playingCardView.addGestureRecognizer(pinch)
    ```

## MyTips
- UIBezierPath
- NSAttributedString
- 之后希望尝试把红桃方块等也换成image
- 几大段直接导入的extension和func，比如`func drawPips()`里绘制数字正面牌面对红心的分布是怎么绘制的，还有extension实现的一些固定数值如圆角矩形的弧度值
- 添加 @objc 声明函数支持 OC