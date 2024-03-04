import Foundation

enum AdvertsType {
    case walking
    case sitting
}

enum SortType:String , CaseIterable {
    case recommendedRanking = "Recommended Ranking"
    case lowestPrice = "Lowest Price"
    case highestPrice = "Highest Price"
    case highestRating = "Highest Rating"
    case lowestRating = "lowest Rating"
}

enum CityType : String,CaseIterable {
    case all = "All"
    case istanbul = "Istanbul"
    case izmir = "Izmir"
    case ankara = "Ankara"
}

