import SwiftUI
import Kingfisher
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                ServicesView()
            }
        }
    }
}

#Preview {
    HomeView()
}
