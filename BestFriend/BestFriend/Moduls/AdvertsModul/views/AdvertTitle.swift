import SwiftUI

struct AdvertHeader: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Pick Your Dog Walker")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("24 Dow Walkers want to help you")
            }
            Spacer()
            Image(systemName: ImageResourceConstants.slider.rawValue)
                .font(.title2)
        }.padding()
    }
}

#Preview {
    AdvertHeader()
       
}
