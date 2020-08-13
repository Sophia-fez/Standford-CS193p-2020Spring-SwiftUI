# lecture_17 Demo_PlayingCard & EmojiArt 总结
## Demo Topics: EmojiArt
- 用相机拍摄背景图

## M model模块
- **EmojiArt.swift**
    + 增加`var imageData: Data?`

## V view模块(storyboard)
- **Main.storyboard**
    + 添加Camera按钮

## C controller模块
- **EmojiArtViewController.swift**
    + camera
    ```
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = ((info[UIImagePickerController.InfoKey.editedImage] ?? info[UIImagePickerController.InfoKey.originalImage]) as? UIImage)?.scaled(by: 0.25) {
            let url = image.storeLocallyAsJPEG(named: String(Date.timeIntervalSinceReferenceDate))
            emojiArtBackgroundImage = (url, image)
            documentChanged()
        }
        picker.presentingViewController?.dismiss(animated: true)
    }
    ```
    会报错`Value of type 'UIImage' has no member 'scaled'`
    改成`.scale(by: 0.25)`仍有问题`Cannot call value of non-function type 'CGFloat'`
    暂时删掉`.scaled(by: 0.25)`
    + `UIImageJPGERepresentation(image, 1.0)`报错误,，改为`image.jpegData(compressionQuality: 1.0)`即可

- **DocumentInfoViewController.swift**

## MyTips
- PlayingCard的demo没做，还搁浅在lecture08，暂时也不打算跟进这个小游戏，以后有机会再回来看看
- `.scaled(by: 0.25)`的问题待解决
- 需要用真机调试，模拟器没有摄像头（不能调用电脑的嘛……？）