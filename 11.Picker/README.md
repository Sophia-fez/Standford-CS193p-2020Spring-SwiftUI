# lecture_11 Demo_Enroute 总结
## Demo Topics: Enroute
- 做一个fliter页面，使用picker实现

## 修改相关功能
- **FliterFlights.swift**
    + fliter筛选器页面
    + 添加picker，选择destination、origin、airlines的功能
    + `Text("Any").tag(String?.none)`是一种给optional String设定nil的方法，这样设置后origin列表里就多了Any选项了
    + destination、origin、airlines的名称都改为更友好的显示方式，不使用简称  
    + Toggle，一个开关

## 最终效果
<img src="./MyDemo_11_Picker&Toggle.png">
<img src="./MyDemo_11_Picker_详情页.png">

## MyTips