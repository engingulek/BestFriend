import Foundation
import Alamofire
public enum NetworkPath {
    case dogWalking
    case sitting
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return NetworkConstants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
       
        case .dogWalking:
            return NetworkConstants.dogWalkings.rawValue
        case .sitting:
            return NetworkConstants.sittings.rawValue
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
