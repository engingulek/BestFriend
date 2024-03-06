import Foundation
import Alamofire
public enum NetworkPath {
    case dogWalking
    case sitting
    case comments(String)
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return NetworkConstants.baseUrl
    }
    
    var path: String {
        switch self {
       
        case .dogWalking:
            return NetworkConstants.dogWalkings.path
        case .sitting:
            return NetworkConstants.sittings.path
        case .comments(let advertId):
            return NetworkConstants.comments(advertId: advertId).path
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
