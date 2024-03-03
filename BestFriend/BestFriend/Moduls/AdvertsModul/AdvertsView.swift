import SwiftUI

struct AdvertsView: View {
    var body: some View {
        
        VStack {
            AdvertHeader()
            ScrollView {
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { count in
                        AdvertLazyVStackTitle()
                          
                    }
                })
            }
        }.navigationTitle(TextConstants.navTitleAdverts.rawValue)
    }
}

#Preview {
    AdvertsView()
      
}
