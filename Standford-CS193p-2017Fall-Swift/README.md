# Swift_CS193p_2017Fall文件夹内容说明
2017Fall的课程因为是fork的[大佬的笔记](https://github.com/Sophia-fez/Standford-CS193p-2017Fall-Swift)，虽然按着自己的想法稍微修改了文件夹命名和一些文件的摆放位置，但修改无法提交。所以现在重新回顾2017Fall课程的swift，这次实际敲一敲代码以及其他的修改都放在这个文件夹里，就把2017Fall[大佬的笔记](https://github.com/Sophia-fez/Standford-CS193p-2017Fall-Swift)当做一个**参考答案**来翻阅吧，我自己写的东西就不放到fork来的仓库里了，也免得混乱，然后也会和swiftUI的demo一样做一个版本记录，用markdown大概记录一下每节课的demo都实现了什么。相较于参考答案，因为swift和xcode的版本问题，有少量代码会存在不一样的情况。

因为2017Fall的课程是全程采用了storyboard实现UI，现在打算先熟悉Xcode使用、复习2017Fall的swift课程，然后再使用snapkit来实现UI，熟悉一下snapkit框架

**Tips**：还是要用Xcode来实际开发一遍，之前mac还没到干看课程or用编辑器将就着敲一敲没办法调试根本不知道哪里有问题，也不了解整个projetc的组成。不过也多亏了之前看过一遍课程也稍微看了一下开发文档，至少小语法不会一脸懵逼了，之前第一遍只能无脑跟敲，现在在复习进一步学习轻松一些并更关注project的构成

## MyTips
- Cassini的image实际显示不出来的问题，但拖动会有滚动条看起来很像只是看不见图片而不是没显示？？？
- Cassini用code实现image view时，scroll view一直存在content size问题，暂时还没找到原因，这个问题解决后再看从网络地址获取图片是否还存在问题
- Concentration在横屏模式下修改，把flips移到右侧时候，如果删掉card stcak view相对safe area trailling constrain时，整个card stack view都会消失，why？？？最后暂时保留了相对safe area trailling constrain，但似乎会影响到flips横屏时分两行显示的功能，数字会消失
