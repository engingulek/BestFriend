import Foundation

enum NetworkConstants {
    static let baseUrl = "https://bestfriend-50a54-default-rtdb.firebaseio.com/"
    
    case dogWalkings
    case sittings
    case comments(advertId: String)
    
    var path: String {
        switch self {
        case .dogWalkings:
            return "dogWalking.json"
        case .sittings:
            return "sittings.json"
        case .comments(let advertId):
            return "comments/\(advertId).json"
        }
    }
}
