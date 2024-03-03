import SwiftUI

struct AdvertsView: View {
    let advertType: AdvertsType

    @ObservedObject private  var viewModel = AdvertsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack{
                    ProgressView("Loading...")
                        .font(.title)
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }else{
                VStack {
                    AdvertHeader(
                        title: viewModel.title,
                        subtitle: "\(viewModel.adverts.count) \(viewModel.subtitle)")
                    ScrollView {
                        LazyVStack(content: {
                            ForEach(viewModel.adverts.sorted(by: {$0.key < $1.key}),id: \.key) { (key, advert) in
                                AdvertLazyVStackTitle(item: (key: key, advert: advert))
                            }
                        })
                    }
                }
            }
        }
        .navigationTitle(TextConstants.navTitleAdverts.rawValue)
        .onAppear {
               viewModel.fetchData(advertType:advertType)
               viewModel.onAppear(advertType: advertType)
            
        }
    }
}

#Preview {
    AdvertsView(advertType: .sitting)
}
