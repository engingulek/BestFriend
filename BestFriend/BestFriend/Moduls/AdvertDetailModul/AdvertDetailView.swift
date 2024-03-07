import SwiftUI
import Kingfisher


struct AdvertDetailView: View {
    var item : (key:String,advert:AdvertValue)
    @ObservedObject private  var viewModel = AdvertDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: SpacingConstants.medium.rawValue){
                KFImage(URL(string: item.advert.imageURL))
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .cornerRadius(RadiusConstant.small.rawValue)
                
                HStack(content: {
                    Text(item.advert.nameSurname)
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack(spacing:1,content: {
                        Image(systemName: ImageResourceConstants.starFill.rawValue)
                            .foregroundColor(.black)
                        Text(String(format: "%.1f", item.advert.rating))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    })
                })
                
                HStack(content: {
                    Image(systemName: ImageResourceConstants.mappinAndEllipse.rawValue)
                    Text(item.advert.locationInfo.city)
                })
                
                
                HStack(content: {
                    Button {
                        UIPasteboard.general.string = item.advert.phoneNumber
                    } label: {
                        Image(systemName: ImageResourceConstants.copy.rawValue).foregroundColor(.primary)
                    }
                    
                    Text("+\(item.advert.phoneNumber)")
                })
                
                HStack{
                    Spacer()
                    subWalkerInfo(count: "\(viewModel.commentList.count)", text: TextConstants.comments.rawValue)
                    Spacer()
                    subWalkerInfo(count: "$\(item.advert.perWage)", text:TextConstants.perHour.rawValue )
                    Spacer()
                }
                
                VStack(alignment:.leading,content: {
                    Text(TextConstants.bio.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(item.advert.info)
                    
                })
                
                VStack(alignment:.leading,content: {
                    
                    Text( TextConstants.comments.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    if viewModel.commentList.isEmpty {
                        VStack {
                            Spacer()
                            Text(viewModel.message)
                                .font(.title3)
                        }
                    }else{
                        Picker(TextConstants.sort.rawValue,selection: $viewModel.commentSortType) {
                            ForEach(CommentSortType.allCases, id: \.self) { sortType in
                                Text(sortType .rawValue).tag(sortType )
                                    .font(.subheadline)
                            }
                        }
                        .pickerStyle(.segmented)
                        .foregroundColor(.black)
                        .onChange(of: viewModel.commentSortType) { oldValue, newValue in
                            viewModel.sortComment()
                        }
                        
                        ScrollView {
                            LazyVStack(spacing:SpacingConstants.large.rawValue,content: {
                                ForEach(viewModel.commentList, id: \.key) { (key,commentValue) in
                                    CommentLaztVStackTitle(item: (key: key, comment: commentValue))
                                    
                                }
                            })
                        }
                    }
                    
                })
            }.padding(.horizontal)
            
        }
        .navigationTitle(TextConstants.navTitleAdvertDetail.rawValue)
        .onAppear {
            viewModel.onAppear(advertId: item.key)
        }
        
    }
}

private struct subWalkerInfo : View {
    let count:String
    let text:String
    var body: some View {
        VStack{
            Text(count)
                .fontWeight(.semibold)
                .font(.title2)
            Text(text)
                .font(.callout)
        }
        
        .frame(width: 80,height: 80)
        .padding(2)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(RadiusConstant.small.rawValue)
    }
}

#Preview {
    AdvertDetailView(item: (key:"key",advert:AdvertValue.defaultAdvertValue))
}
