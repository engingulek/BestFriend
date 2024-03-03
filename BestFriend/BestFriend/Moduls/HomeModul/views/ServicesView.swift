
import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack{
            Text(TextConstants.services.rawValue)
                .fontWeight(.semibold)
                .font(.callout)
            HStack {
                NavigationLink {
                    AdvertsView()
                } label: {
                    serviceRectangle(.leash,TextConstants.walking.rawValue)
                }
                
                NavigationLink {
                    AdvertsView()
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
        .cornerRadius(10)
        .frame(
            width: 150, height: 150)
        .overlay {
            VStack(spacing:20) {
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
