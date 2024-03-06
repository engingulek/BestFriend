
import SwiftUI
import Kingfisher
struct CommentLaztVStackTitle: View {
    var item : (key:String,comment:CommentValue)
    var body: some View {
        VStack(alignment:.leading, content: {
            HStack(content: {
                KFImage(URL(string: item.comment.userImageURL))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    Text(item.comment.userName)
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(item.comment.date)
                }
            })
            .frame(maxWidth: .infinity)
            Text(item.comment.comment)
        })
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(RadiusConstant.small.rawValue)
     

            
    }
}

#Preview {
    CommentLaztVStackTitle(item: (key: "key", comment: CommentValue.defaultcommnetValue))
}
