import SwiftUI

struct AdvertHeader: View {
    let title:String
    let subtitle:String
    @State  var isSheetPrsentedSort : Bool = false
    @State  var isSheetPrsentedFilter : Bool = false
    @ObservedObject  var viewModel : AdvertsViewModel
    var body: some View {
        VStack{
            HStack(content: {
                VStack(alignment:.leading){
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(subtitle)
                }
                Spacer()
            })
       
            Picker(selection: $viewModel.sortType) {
                ForEach(SortType.allCases, id: \.self) { sort in
                    Text(sort.rawValue).tag(sort)
                        .font(.subheadline)
                }
            } label: {
                Text(TextConstants.sort.rawValue)
            }
            .pickerStyle(.navigationLink)
            .foregroundColor(.black)
            
            Picker(selection: $viewModel.cityType) {
                ForEach(CityType.allCases, id: \.self) { city in
                    Text(city.rawValue).tag(city)
                        .font(.subheadline)
                }
            } label: {
                Text(TextConstants.city.rawValue)
            }
            .pickerStyle(.navigationLink)
            .foregroundColor(.black)
            
        }.padding()
    }
}

#Preview {
    AdvertHeader(title: "Dog Walkers", subtitle: "\(TextConstants.sitting.rawValue) want to help you", viewModel: AdvertsViewModel())
    
}
