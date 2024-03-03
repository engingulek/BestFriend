import SwiftUI
import Kingfisher
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                UpcomingView()
                ServicesView()
            }
        }
       
    
    }
}

#Preview {
    HomeView()
}
