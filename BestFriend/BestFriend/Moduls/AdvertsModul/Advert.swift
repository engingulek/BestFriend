import Foundation


// MARK: - AdvertValue
struct AdvertValue: Decodable {
 
    
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
    static let defaultAdvertValue : AdvertValue = .init(
        imageURL: "",
        info: "",
        locationInfo: LocationInfo(
            city: ""),
        nameSurname: "",
        perWage: 0,
        rating: 0)
    
}

// MARK: - LocationInfo
struct LocationInfo: Decodable {
    let city:String
}

typealias AdvertResult = [String: AdvertValue]

