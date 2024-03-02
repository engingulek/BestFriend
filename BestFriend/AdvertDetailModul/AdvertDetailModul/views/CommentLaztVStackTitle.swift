

import SwiftUI
import Kingfisher
struct CommentLaztVStackTitle: View {
    var body: some View {
        VStack(alignment:.leading,content: {
            HStack(content: {
                KFImage(URL(string: "https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))
                    .resizable()
                    .frame(width: 50,height:  50)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    Text("Name Surname")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("04/03/2024")
                }
                
            })
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to")
        })
        .padding()
        .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
    }
}

#Preview {
    CommentLaztVStackTitle()
}
