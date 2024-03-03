import SwiftUI
import Kingfisher
struct AdvertDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 15){
                KFImage(URL(string: "https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))
                    .resizable()
                    .frame(width: .infinity,height: 400)
                    .cornerRadius(10)
                
                HStack(content: {
                    Text("Jack Dan")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack(spacing:1,content: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                        Text("4.5")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    })
                })
                
                HStack(content: {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Bakırköy,Istanbul")
                })
                
                HStack{
                   Spacer()
                    subWalkerInfo(count: "60", text: "Reviews")
                    Spacer()
                    subWalkerInfo(count: "150", text: "Walks")
                    Spacer()
                    subWalkerInfo(count: "$23", text:"per hour" )
                    Spacer()
                }
                
                VStack(alignment:.leading,content: {
                    Text("Bio")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic ")
                
                })
             
                VStack(alignment:.leading,content: {
                    Text("Comments")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ScrollView {
                        LazyVStack(spacing:20,content: {
                            ForEach(1...10, id: \.self) { count in
                                CommentLaztVStackTitle()
                                  
                            }
                        })
                    }
                })
            }.padding(.horizontal)
            
        }
     
    }
}

private struct subWalkerInfo : View {
    let count:String
    let text:String
    var body: some View {
        VStack{
            Text(count)
                .fontWeight(.semibold)
                .font(.title2)
            Text(text)
                .font(.callout)
        }
        .frame(width: 80,height: 80)
        .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
    }
}

#Preview {
    AdvertDetailView()
}
