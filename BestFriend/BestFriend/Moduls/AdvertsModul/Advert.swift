import Foundation


// MARK: - AdvertValue
struct AdvertValue: Decodable {
    let imageURL: String
    let info: String
    let locationInfo: LocationInfo
    let nameSurname: String
    let perWage: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case info, locationInfo, nameSurname, perWage
    }
}

// MARK: - LocationInfo
struct LocationInfo: Decodable {
    let city, district: String
}

typealias AdvertResult = [String: AdvertValue]
