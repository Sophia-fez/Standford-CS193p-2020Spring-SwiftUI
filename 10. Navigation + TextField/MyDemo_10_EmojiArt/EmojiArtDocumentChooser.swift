import SwiftUI

struct EmojiArtDocumentChooser: View{
	@EnvironmentObject var store: EmojiArtDocumentStore

	@State private var editMode: EditMode = .inactive

	var body: some View{
		NavigationView{
			List{
				ForEach(store.documents){document in
					NavigationLink(destination: EmojiArtDocumentView(document: document)
						.navigationBarTitle(self.store.name()for: document) //页面title
					){
						// 编辑文件名称
						EditableText(self.store.name(for: document), isEditing: self.editMode.isEditing){name in
							self.store.setName(name, for: document)
						}
					}
				}
			}
			.navigationBarTitle(self.store.name) //页面title
			.navigationBarItems(leading: Button(action: {  //新建按钮
				self.store.addDocument()
			},label:{
				Image(systemName: "plus").imageScale(.large)
			}))
			trailing: EditButton()
		}
			.environment(\.editMode, $editMode)
	}
}

struct EmojiArtDocumentChooser_Previews: PreviewProvider{
	static var previews: some View{
		EmojiArtDocumentChooser()
	}
}