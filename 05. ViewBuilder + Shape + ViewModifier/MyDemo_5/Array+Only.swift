import Foundation

extension Array{ //针对所有Array的extension
	var only: Element?{
		count == 1 ? first : nil //省略了return
	}
}