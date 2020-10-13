# lecture_11 Demo_EmojiArt 总结
## Demo Topics: EmojiArt
- drag & drop
- add & delete

## M model模块

## V view模块(storyboard)
- **Main.storyboard**
    + 建立两个通用UIView，dropZone和emojiArtView
    + 建立splitview
    + 建立tableview作为masterview，设置1个prorotype cell，dynamic prototypes，设置这个cell的style为basic，identifier为DocumentCell
    + 加入bar button item，system item改为add，这就是新建文档的按钮

## C controller模块
- **EmojiArtViewController.swift**
    + `func dropInteraction` drop & drag，实现可以从浏览器拖入图片的功能

- **EmojiArtDocumentTableViewController.swift**
    + 新建文档，保证不重名
    ```
    @IBAction func newEmojiArt(_ sender: UIBarButtonItem) {
        // 保证命名唯一
        emojiArtDocuments += ["Untitled".madeUnique(withRespectTo: emojiArtDocuments)]
        tableView.reloadData()
    }
    ```
    + 删除文档
    ```
    // 删除
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojiArtDocuments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    ```
    + 虽然有新建和删除文档的功能，但是实际上没有存储文件，重启APP就没有了

## MyTips