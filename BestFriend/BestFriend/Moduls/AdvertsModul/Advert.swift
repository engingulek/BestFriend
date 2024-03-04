import Foundation


// MARK: - AdvertValue
struct AdvertValue: Decodable,Equatable {
    static func == (lhs: AdvertValue, rhs: AdvertValue) -> Bool {
        return true
    }
    
    let imageURL: String
    let info: String
    let locationInfo: LocationInfo
    let nameSurname: String
    let perWage: Int
    let rating : Double

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case info, locationInfo, nameSurname, perWage
        case rating
    }
}

// MARK: - LocationInfo
struct LocationInfo: Decodable {
    let city:String
}

typealias AdvertResult = [String: AdvertValue]
