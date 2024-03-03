
import Foundation
import Alamofire

enum NetworkError : Error {
    case invalidResponse
    case defaultStatusCode
    case valueError
    case noRequestResource
}

 protocol NetworkManagerProtocol{
    func request<T:Decodable>(
        target:NetworkPath,
        responseClass:T.Type) async throws -> T
}

final class NetworkManager : NetworkManagerProtocol  {
    
    static let shared :NetworkManagerProtocol  = NetworkManager()
    
    init() {}
    
   func request<T:Decodable>(
        target: NetworkPath,
        responseClass: T.Type) async throws -> T  {
            
            let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
            let fetchUrl = target.baseURL + target.path
            let parameters = buildParams(requestType: target.requestType)
            let request = AF.request(
                fetchUrl,
                method: method,
                parameters: parameters.0,
                encoding: parameters.1
            )
                .validate()
                .serializingDecodable(T.self)
            
            let result = await request.response
            
            guard let response = result.response else {
                throw NetworkError.invalidResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let value = result.value else {
                    throw NetworkError.valueError
                }
                return value
            case 404:
                throw NetworkError.noRequestResource
            default:
                throw NetworkError.defaultStatusCode
            }
        }
    
    
      private func buildParams(requestType: RequestType) -> ([String: Any], ParameterEncoding) {
           
           switch requestType {
           case .requestPlain:
               return ([:], URLEncoding.default)
           case .requestParameters(parameters: let parameters, encoding: let encoding):
               return (parameters, encoding)
           }
       }
}
