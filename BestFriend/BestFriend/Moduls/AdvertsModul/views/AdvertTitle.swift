import SwiftUI

struct AdvertHeader: View {
    let title:String
    let subtitle:String
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(subtitle)
            }
            Spacer()
            Image(systemName: ImageResourceConstants.slider.rawValue)
                .font(.title2)
        }.padding()
    }
}

#Preview {
    AdvertHeader(title: "", subtitle: "")
       
}
