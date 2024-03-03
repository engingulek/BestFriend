import SwiftUI
import Kingfisher
struct AdvertLazyVStackTitle: View {
    var body: some View {
        HStack(content: {
            KFImage(URL(string: "https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))
                .resizable()
                .frame(width: 130,height: 170)
                .cornerRadius(10)
            
            VStack(alignment:.leading,
                   spacing: 10,
                   content: {
                Text("Brianna Fow")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack(content: {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Bakırköy,Istanbul")
                })
                
                HStack(alignment:.center) {
                    subWalkerInfo(image: "star.fill", text: "4.5")
                    subWalkerInfo(image: "figure.walk", text: "50 walks")
                    subWalkerInfo(image: "dollarsign", text: "23/h")
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic ")
                    .font(.callout)
                    .lineLimit(3)
            })
        }).padding()
    }
}


private struct subWalkerInfo : View {
    let image:String
    let text:String
    var body: some View {
        HStack(spacing:1,content: {
            Image(systemName: image)
                .foregroundColor(.black)
            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        })
    }
}

#Preview {
    AdvertLazyVStackTitle()
}
