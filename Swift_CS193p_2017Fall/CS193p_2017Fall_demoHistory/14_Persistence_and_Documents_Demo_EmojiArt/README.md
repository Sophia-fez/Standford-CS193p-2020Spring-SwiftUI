# lecture_14 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- 存储文件到本地/icloud

## M model模块
- **EmojiArt.swift**
    + 将EmojiArt变得codeable，能转变为JOSN格式，加上`Codabel`就可以了
    + encode
    + decode

## V view模块(storyboard)
- **Main.storyboard**
    + 删除spit view和master view
    + 将Emoji Art view embed in navigation view
    + 增加保存按钮，加入bar button，将其改成save

## C controller模块
- **EmojiArtViewController.swift**
    + controller链接model
    ```
    // MARK: - Model
    
    var emojiArt: EmojiArt? {
        get {
            if let url = emojiArtBackgroundImage.url {
                let emojis = emojiArtView.subviews.compactMap { $0 as? UILabel }.compactMap{ EmojiArt.EmojiInfo(label: $0) }
                return EmojiArt(url: url, emojis: emojis)
            }
            return nil
        }
        set {
            emojiArtBackgroundImage = (nil, nil)
            emojiArtView.subviews.compactMap { $0 as UILabel }.forEach { $0.removeFromSuperview() }
        }
    }
    ```
    其中`flatMap`已不再建议使用，换成`compactMap`
    + 使得encodable，encode操作，将document存储为json格式
    ```
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let json = emojiArt?.json {
            if let url = try? FileManager.default.url (
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            ).appendingPathComponent("Untitled.json") {
                do {
                    try json.write(to: url)
                    print("saved successfully!")
                } catch let error {
                    print("couldn't save \(error)")
                }
            }
        }
    }
    ```
    + `info.plist` 里 add row，`Supports Document Browser`并设置为YES，这是告诉system可以查看document directory
    + 显示上次保存的文件
    ```
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = try? FileManager.default.url (
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("Untitled.json") {
            if let jsonData = try? Data(contentsOf: url) {
                emojiArt = EmojiArt(json: jsonData)
            }
        }
    }
    ```

- **EmojiArtDocumentTableViewController.swift**

- **EmojiCollectionViewCell.swift**

- **EmojiArtView+Gestures.swift**

- **TextFieldCollectionViewCell.swift**

## 新建一个项目（Document Based App）
把原来的文件，storyboard都复制进来
在 info 里面把 Document types name改为JSON,types改为public.json
## M model模块
- **EmojiArt.swift**

## V view模块(storyboard)
- **Main.storyboard**
    + 删除默认创建的DocumentViewController页面，将EmojiArtViewController复制进来
    + 添加一个bar button，system item改为done
    + `navigation view` 的 storyboard ID 命名为 `DocumentMVC`

## C controller模块
- **EmojiArtViewController.swift**
    + 重写保存文件的功能
    ```
    var document: EmojiArtDocument?
    
    @IBAction func save(_ sender: UIBarButtonItem? = nil) {
        document?.emojiArt = emojiArt
        if document?.emojiArt != nil {
            document?.updateChangeCount((.done))
        }
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        save()
        document?.close()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        document?.open{ success in
            if success {
                self.title = self.document?.localizedName
                self.emojiArt = self.document?.emojiArt
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("Untitled.json") {
            document = EmojiArtDocument(fileURL: url)
        }
    }
    ```

- **EmojiArtDocument.swift**
    + `Document.swift`更名为`EmojiArtDocument.swift`

- **DocumentViewController.swift** 
    + 和EmojiArtViewController功能重复，删除

## MyTips
- 需要对照参考答案的注释，再看一下，然后写一下注释，理解各部分代码的构成和整体协作