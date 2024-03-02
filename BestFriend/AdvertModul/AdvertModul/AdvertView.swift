import SwiftUI

struct AdvertView: View {
    var body: some View {
        AdvertHeader()
        ScrollView {
            LazyVStack(content: {
                ForEach(1...10, id: \.self) { count in
                    AdvertLazyVStackTitle()
                      
                }
            })
        }
    }
}

#Preview {
    AdvertView()
}
