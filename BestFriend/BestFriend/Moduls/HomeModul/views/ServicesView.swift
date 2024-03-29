
import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack{
            Text(TextConstants.services.rawValue)
                .fontWeight(.semibold)
                .font(.callout)
            HStack {
                NavigationLink {
                    AdvertsView(advertType: .walking)
                } label: {
                    serviceRectangle(.leash,TextConstants.walking.rawValue)
                }
                
                NavigationLink {
                    AdvertsView(advertType: .sitting)
                } label: {
                    serviceRectangle(.animalCare,TextConstants.sitting.rawValue)
                }
            }
        }
    }
}

private struct serviceRectangle : View {
    let image:ImageResource
    let text:String
    init(_ image: ImageResource, _ text: String) {
        self.image = image
        self.text = text
    }
    var body: some View {
        Rectangle()
        .fill(Color.red)
        .cornerRadius(RadiusConstant.small.rawValue)
        .frame(
            width: 150, height: 150)
        .overlay {
            VStack(spacing:SpacingConstants.large.rawValue) {
                Image(image)
                    .resizable()
                    .frame(width: 50,height: 50)
                Text(text)
                    .font(.callout)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ServicesView()
}
