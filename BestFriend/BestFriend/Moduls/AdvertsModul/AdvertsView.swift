import SwiftUI

struct AdvertsView: View {
    let advertType: AdvertsType
    @ObservedObject private  var viewModel = AdvertsViewModel()
    
    var body: some View {
        VStack {
            AdvertHeader(
                title: viewModel.title,
                subtitle: viewModel.subtitle)
            ScrollView {
                LazyVStack(content: {
                    ForEach(viewModel.adverts, id: \.id) { advert in
                        AdvertLazyVStackTitle(advert: advert)
                    }
                })
            }
        }
        .navigationTitle(TextConstants.navTitleAdverts.rawValue)
        .onAppear {
            viewModel.onAppear(advertType: advertType)
        }
    }
}

#Preview {
    AdvertsView(advertType: .sitting)
}
