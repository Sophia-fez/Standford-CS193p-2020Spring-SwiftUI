## Mac快捷键

### Xcode快捷键

cmd+N           新建文件
cmd+R			运行程序  
cmd+0			显示/隐藏 左侧窗格  
cmd+option+0	显示/隐藏 右侧窗格  
cmd+1,2,3,4,5	右侧窗格内切换  
cmd+shift+y		显示/隐藏 控制台  
cmd+option+shift+enter	打开辅助编辑窗格 add editor on right  
cmd+shift+o				搜索并打开想要的文件  
cmd+shift+左箭头   选中光标所在行以左  
cmd+shift+右箭头   选中光标所在行以右  
Xcode->File->Open Recent->Clear Menu，清除右侧的最近打开过的项目的历史记录，删了源文件都没用历史记录还在的，只能这样一键清理所有历史记录 

cmd+E搜索选定的内容，cms+G下一个 
shift+control选择storyboard里的view图层

### 窗口

**command+空格  搜索框**
输入term/终端, 调出终端  
输入活动监视器，调出活动监视器

cmmand+Q	退出程序  
cmmand+W	关闭窗口  
cmmand+M	最小化窗口  
option+command+esc	强制退出程序  
Command+Option+H    隐藏除当前应用程序之外所有程序窗口  

### 文件夹内对文件的操作  
cmmand+delete			删除文件（会进入废纸篓）  
cmmand+option+delete	彻底删除文件  
cmmand+shift+delete		倾倒废纸篓  

control+command+1	按名称自动排列  
control+command+2	按种类自动排列  

command+shift+G	输入路径并跳转到目标
command+n	新建访达  
command+C	复制文件  
Command+V	在目标位置拷贝文件  
Command+[       回到上一页
Command+]       前往下一页

### safari浏览器  
Command+R	刷新网页  
Command+D	添加书签  
Command+T   当前页面添加新标签页面  
Command+N   添加新的safari页面
Command+Shift+N     添加新的无痕浏览safari页面
Command+Z   恢复之前关闭的页面
Command+Control+1 关闭边栏

### 隐藏文件问题：

（不知道有没有更好的办法）  
Mac下初始化仓库后，默认是不显示.git文件的。如果需要展示的话，可以执行下面的命令：（其他隐藏的文件、文件夹也可以这样显示）  
显示文件夹：  
defaults write com.apple.finder AppleShowAllFiles TRUE        #显示文件夹  
killall Finder        #重启finder  
隐藏文件夹：  
defaults write com.apple.finder AppleShowAllFiles FALSE        #隐藏文件夹  
killall Finder        #重启finder  

### 更改文件的默认打开方式：

- 更改某一个文件的默认打开方式
  - 右键单击该zhi文件
  - 按下 Option 键，你会看到「打开dao方式」选项变成了「始终以此方式打开」
  - 选择「始终以此方式打开」列表内的某一个应用程序。
    那么该文件应该在你刚刚选择的应用程序(本例为 Pixelmator)内打开，并且，该文件以后也会默认以这个应用程序打开。

- 更改同类型文件的默认打开方式
  - 右键单击该文件，然后选择「显示简介」选项
  - 找到「打开方式」项目，点击倒三角选择你想指定的默认应用程序。
  - 单击「全部更改」按钮即可生效。