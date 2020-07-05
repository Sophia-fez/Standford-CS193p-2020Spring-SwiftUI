import SwiftUI

struct EmojiArtDocumentChooser: View{
	@EnvironmentObject var store: EmojiArtDocumentStore

	var body: some View{
		NavigationView{
			List{
				ForEach(store.documents){document in
					NavigationLink(destination: EmojiArtDocumentView(document: document)
						.navigationBarTitle(self.store.name()for: document)){  //页面title
						Text(self.store.name(for: document))
					}
				}
			}
			.navigationBarTitle(self.store.name) //页面title
			.navigationBarItems(leading: Button(action: {  //新建按钮
				self.store.addDocument()
			},label:{
				Image(systemName: "plus").imageScale(.large)
			}))
		}
	}
}

struct EmojiArtDocumentChooser_Previews: PreviewProvider{
	static var previews: some View{
		EmojiArtDocumentChooser()
	}
}