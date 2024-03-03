import Kingfisher
import SwiftUI

struct UpcomingView : View {
    var body: some View {
        VStack {
            Text(TextConstants.upcoming.rawValue)
                .fontWeight(.semibold)
                .font(.callout)
            Rectangle()
                .fill(Color.red)
                .cornerRadius(10)
                .frame(
                    width: 200, height: 200)
                .overlay {
                    VStack {
                        KFImage(URL(string: "https://images.pexels.com/photos/1073097/pexels-photo-1073097.jpeg?auto=compress&cs=tinysrgb&w=1200")!)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 80,height: 80)
                       
                        VStack{
                            Text("Matthew Thomas")
                                .foregroundColor(.white)
                            textWithIcon(imageText: ImageResourceConstants.calendar.rawValue, text: "Friday,July 20")
                            textWithIcon(imageText: ImageResourceConstants.clock.rawValue, text: "12 pm - 2 pm")
                            
                        }
                    }
                   
                }
        }
    }
}

private struct textWithIcon : View {
    let imageText:String
    let text:String
    var body: some View {
        HStack{
            Image(systemName: imageText)
                          
                        Text(text)
        }  .foregroundColor(.white)
    }
}
