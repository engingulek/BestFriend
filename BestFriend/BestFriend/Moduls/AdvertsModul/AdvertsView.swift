import SwiftUI

struct AdvertsView: View {
    let advertType: AdvertsType
    @ObservedObject   var viewModel = AdvertsViewModel()
    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack{
                    ProgressView(TextConstants.loading.rawValue)
                        .font(.title)
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }else{
                VStack {
                    AdvertHeader(
                        title: viewModel.title,
                        subtitle: "\(viewModel.advertList.count) \(viewModel.subtitle)",viewModel: viewModel)
                    if viewModel.message.isEmpty {
                        ScrollView {
                            LazyVStack(content: {
                                ForEach(viewModel.advertList,id: \.key) { (key, advert) in
                                    NavigationLink {
                                        AdvertDetailView(item: (key:key,advert:advert))
                                    } label: {
                                        AdvertLazyVStackTitle(item: (key: key, advert: advert))
                                            .foregroundColor(.primary)
                                    }
                                }
                            })
                        }
                    }else{
                        VStack(content: {
                            Spacer()
                            Text(viewModel.message)
                                .font(.title2)
                            Spacer()
                        })
                    }
                }
            }
        }
        .navigationTitle(TextConstants.navTitleAdverts.rawValue)
        .onAppear {
            viewModel.fetchData(advertType: advertType)
            viewModel.onAppear(advertType: advertType)
        }
    }
}

#Preview {
    AdvertsView(advertType: .sitting)
}
