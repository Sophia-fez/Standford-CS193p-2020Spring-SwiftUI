# lecture_12 Demo_Enroute 总结
## Demo Topics: Enroute
- Change Enroute to fetch the FlightAware data into **Core Data**.
- And then have Enroute’s UI get all of its information from **Core Data**.
- 原来的String都要改成object，相关的地方都要修改

## 建立objectModel
- 新建项目，勾选 "Use Core Data"的选项，然后再把上节课的代码放进来，再改bug

## 修改相关功能
- **FlightsEnrouteView.swift**
    + 将var改成object-oriented，在database里创建这些object，然后咋database里查找它们，这就是CoreData的全部内容

- **Airport.swift**
    + fetch获取相关信息，封装成extension
    + loading up database with things that are coming in from FlightAware
    + objectModel里把绝不会为nil的attribute加上 `_`，并使用extension来进行设置，这样不可能为nil，因为如果为nil其根本就不存在

- **Airline.swift** 同上

- **Flight.swift** 同上

- **FlightFetcher.swift**
    + `class FlightFetcher: ObservableObject{}`不再需要了因为现在用CoreData了，注释掉并重新build
