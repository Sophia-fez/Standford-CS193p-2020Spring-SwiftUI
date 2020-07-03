import SwiftUI

struct OptionalImage: View{
	var uiImage: UIImage?

	var body: some View{
		Group{
			if uiImage != nil {
				Image(uilImage: uiImage!)
			}
		}
	}
}