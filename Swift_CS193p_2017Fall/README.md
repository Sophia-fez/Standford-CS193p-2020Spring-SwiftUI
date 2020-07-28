# Swift_CS193p_2017Fall文件夹内容说明
2017Fall的课程因为是fork的[大佬的笔记](https://github.com/Sophia-fez/Standford-CS193p-2017Fall-Swift)，虽然按着自己的想法稍微修改了文件夹命名和一些文件的摆放位置，但修改无法提交。所以现在重新回顾2017Fall课程的swift，这次实际敲一敲代码以及其他的修改都放在这个文件夹里，就把2017Fall[大佬的笔记](https://github.com/Sophia-fez/Standford-CS193p-2017Fall-Swift)当做一个**参考答案**来翻阅吧，我自己写的东西就不放到fork来的仓库里了，也免得混乱，然后也会和swiftUI的demo一样做一个版本记录，用markdown大概记录一下每节课的demo都实现了什么。

因为2017Fall的课程是全程采用了storyboard实现UI，现在打算先熟悉Xcode使用、复习2017Fall的swift课程，然后再使用snapkit来实现UI，熟悉一下snapkit框架

**Tips：**还是要用Xcode来实际开发一遍，之前mac还没到干看课程or用编辑器将就着敲一敲没办法调试根本不知道哪里有问题，也不了解整个projetc的组成。不过也多亏了之前看过一遍课程也稍微看了一下开发文档，至少小语法不会一脸懵逼了，之前第一遍只能无脑跟敲，现在在复习进一步学习轻松一些并更关注project的构成

## Xcode快捷键
cmd+R			运行程序  
cmd+0			显示/隐藏 左侧窗格  
cmd+option+0	显示/隐藏 右侧窗格  
cmd+1,2,3,4,5	右侧窗格内切换  
cmd+shift+y		显示/隐藏 控制台  
cmd+option+shift+enter	打开辅助编辑窗格 add editor on right  
cmd+shift+o				搜索并打开想要的文件  
cmd+shift+左箭头   选中光标所在行以左  
cmd+shift+右箭头   选中光标所在行以右  

## Mac快捷键
**command+空格  搜索框**
输入term/终端, 调出终端  
输入活动监视器，调出活动监视器

cmmand+Q	退出程序  
cmmand+W	关闭窗口  
cmmand+M	最小化窗口  
option+command+esc	强制退出程序  


**文件夹内对文件的操作：**  
cmmand+delete			删除文件（会进入废纸篓）  
cmmand+option+delete	彻底删除文件  
cmmand+shift+delete		倾倒废纸篓  


control+command+1	按名称自动排列  
control+command+2	按种类自动排列  


command+n	新建访达  
command+C	复制文件  
Command+V	在目标位置拷贝文件  
command+option+v	移动文件  


**safari浏览器：**  
Command+R	刷新网页  
Command+D	添加书签  
Command+Option+H	隐藏除当前应用程序之外所有程序窗口  

**隐藏文件问题：**（不知道有没有更好的办法）  
Mac下初始化仓库后，默认是不显示.git文件的。如果需要展示的话，可以执行下面的命令：（其他隐藏的文件、文件夹也可以这样显示）  
显示文件夹：  
defaults write com.apple.finder AppleShowAllFiles TRUE        #显示文件夹  
killall Finder        #重启finder  
隐藏文件夹：  
defaults write com.apple.finder AppleShowAllFiles FALSE        #隐藏文件夹  
killall Finder        #重启finder  