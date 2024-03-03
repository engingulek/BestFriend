
import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack{
            Text("Services")
                .fontWeight(.semibold)
                .font(.callout)
            HStack {
                NavigationLink {
                    
                } label: {
                    serviceRectangle(.leash,"Walking")
                }
                
                NavigationLink {
                    
                } label: {
                    serviceRectangle(.animalCare,"Sitting")
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
