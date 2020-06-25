import SwiftUI

struct ContenView: View{
	var vody: some View{
		HStack{
			ForEach(0..<4){
				CardView(isFaceUp: false)
			}
		}
			.padding()
			.foregroundColor(Color.orange)
			.font(Font.largeTitle)
	}
}

struct CardView: View{
	var isFaceUp: Bool

	var body: some View{
		ZStack{
			if isFaceUp{
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text("X")
			}else{
				//会自动匹配上面的foregroundColor(Color.orange)
				RoundedRectangle(cornerRadius: 10.0).fill() 
			}
		}
	}
}