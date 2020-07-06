//view
import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
	var items: [Item]
	var viewForItem: (Item) -> ItemView

	//_表示不提供外部名称，内外部名称一样
	init(_ items: [Item], viewForItem: @escaping (Item) -> ItemVIew){
		self.items = items
		self.viewForItem = viewForItem //@escaping和这里的self产生的memory cycle有关
	}

	var body: some View{
		//1.获取了grid分配的空间
		GeometryReader{geometry in
			self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
		}
	}

	//2.使用GridLayout将空间划分
	func body(for layout: GridLayout) -> some View{
		ForEach(items){ item in
			self.body(for: item, in: layout)
		}
	}

	func body(for item: Item, in layout: GridLayout) -> some View{
		let index = items.firstIndex(matching: item)! //optional的感叹号移到这里
		//因为永远不可能是nil，所以可以直接return
		return viewForItem(item)
			//3.把空间分给subview
			.frame(width: layout.itemSize.width, height: layout.itemSize.height)
			//4.并把它们放置到对应的位置
			.position(layout.location(ofItemAt: index)) 

	}

}

//----------------------------

// //封装前的
// 	var body: some View{

// 		GeometryReader{geometry in //找出grid分配了多少空间
// 			ForEach(items){ item in  //ItemView: View解决这里的报错
// 				self.viewForItem(item) //where Item: Identifiable解决这里的报错
// 			}
// 		}
// 	}

// //封装后的
// 	var body: some View{
// 		GeometryReader{geometry in //找出grid分配了多少空间
// 			self.body(for: geometry.size)
// 		}
// 	}

// 	func body(for size: CGSize) -> some View{
// 		ForEach(items){ item in
// 			self.body(for: item, in: size)
// 		}
// 	}

// 	func body(for item: Item, in size: CGSize) -> some View{
// 		return viewForItem(item)
// 	}


//----------------------------

// //使用extension避免重复寻找id对应的index
// 	func body(for item: Item, in layout: GridLayout) -> some View{
// 		let index = self.index(of: item) //前一个index是func，后一个是variable，所以要加self.
// 		return viewForItem(item)
// 			//3.把空间分给subview
// 			.frame(width: layout.itemSize.width, height: layout.itemSize.height)
// 			//4.并把它们放置到对应的位置
// 			.position(layout.location(ofItemAt: index))
// 	}

// 	//这段代码和MemoryGame.swift里是完全一样的，这样做是不好的，封装到extension里
// 	func index(of item: Item) -> Int{
// 		for index in 0..<items.count{
// 			if item[index].id == item.id{
// 				return index
// 			}
// 		}
// 		return 0  //TODO: bogus!
// 	}

// // 把寻找index的func封装到对Array的extension里
// // 这里的extension和view没关系放到单独的文件里Array+Identifiable.swift
// extension Array where Element: Identifiable{
// 	//现在索引不是Item而是Element
// 	func index(of item: Element) -> Int{
// 		for index in 0..<self.count{ //items改成self
// 			if self[index].id == item.id{
// 				return index
// 			}
// 		}
// 		return 0  //TODO: bogus!
// 	}
// }

//----------------------------

// //使用option前
// 	func body(for item: Item, in layout: GridLayout) -> some View{
// 		let index = items.firstIndex(matching: item)
// 		return viewForItem(item)
// 			//3.把空间分给subview
// 			.frame(width: layout.itemSize.width, height: layout.itemSize.height)
// 			//4.并把它们放置到对应的位置
// 			.position(layout.location(ofItemAt: index))
// 	}

// //使用option后，用Group包装
// 	func body(for item: Item, in layout: GridLayout) -> some View{
// 		let index = items.firstIndex(matching: item)
// 		return Group{  //如果是nil就返回empty view
// 			if index != nuil{
// 				return viewForItem(item)
// 					//3.把空间分给subview
// 					.frame(width: layout.itemSize.width, height: layout.itemSize.height)
// 					//4.并把它们放置到对应的位置
// 					.position(layout.location(ofItemAt: index!)) //optional
// 			}
// 		}

// 	}