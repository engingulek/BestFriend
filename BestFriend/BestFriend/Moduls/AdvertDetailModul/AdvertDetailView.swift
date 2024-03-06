import SwiftUI
import Kingfisher
struct AdvertDetailView: View {
    var item : (key:String,advert:AdvertValue)
    @ObservedObject private  var viewModel = AdvertDetailViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 15){
                KFImage(URL(string: item.advert.imageURL))
                    .resizable()
                    .frame(width: 350,height: 400)
                    .cornerRadius(10)
                
                HStack(content: {
                    Text(item.advert.nameSurname)
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack(spacing:1,content: {
                        Image(systemName: ImageResourceConstants.starFill.rawValue)
                            .foregroundColor(.black)
                        Text(String(format: "%.1f", item.advert.rating))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    })
                })
                
                HStack(content: {
                    Image(systemName: ImageResourceConstants.mappinAndEllipse.rawValue)
                    Text(item.advert.locationInfo.city)
                })
                
                HStack{
                   Spacer()
                    subWalkerInfo(count: "\(viewModel.comments.count)", text: TextConstants.reviews.rawValue)
                    Spacer()
                    //subWalkerInfo(count: "150", text: TextConstants.walks.rawValue)
                   // Spacer()
                    subWalkerInfo(count: "$\(item.advert.perWage)", text:TextConstants.perHour.rawValue )
                    Spacer()
                }
                
                VStack(alignment:.leading,content: {
                    Text(TextConstants.bio.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(item.advert.info)
                
                })
             
                VStack(alignment:.leading,content: {
                    Text( TextConstants.comments.rawValue)
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
            
        }.onAppear {
            viewModel.onAppear(advertId: item.key)
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
    AdvertDetailView(item: (key:"key",advert:AdvertValue.defaultAdvertValue))
}
