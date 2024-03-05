import SwiftUI
import Kingfisher
struct AdvertLazyVStackTitle: View {
    let item : (key:String,advert:AdvertValue)
    var body: some View {
        HStack(content: {
            KFImage(URL(string: item.advert.imageURL))
                .resizable()
                .frame(width: 130,height: 170)
                .cornerRadius(10)
            
            VStack(alignment:.leading,
                   spacing: 10,
                   content: {
                Text(item.advert.nameSurname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack(content: {
                    Image(systemName: ImageResourceConstants.mappinAndEllipse.rawValue)
                    Text("\(item.advert.locationInfo.city)")
                })
                
                HStack(alignment:.center) {
                    
                    subWalkerInfo(image: ImageResourceConstants.starFill.rawValue, text: "\(item.advert.rating)")
                    //subWalkerInfo(image: ImageResourceConstants.walk.rawValue , text: "50 walks")
                    subWalkerInfo(image: ImageResourceConstants.dollarsign.rawValue, text: "\(item.advert.perWage)/h")
                    
                }
                
                Text(item.advert.info)
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

/*#Preview {
    AdvertLazyVStackTitle(advert: Advert.defaultAdvert)
}*/
