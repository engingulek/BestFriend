
import Foundation

protocol AdvertsServicProtocol {
    func fetchDogWalkerAdverts() async throws -> AdvertResult
    func fetchSitterAdverts() async throws -> AdvertResult
}


class AdvertsService : AdvertsServicProtocol {
    
    
    static let shared = AdvertsService()
    
    func fetchDogWalkerAdverts() async throws -> AdvertResult {
        do {
            let response = try await NetworkManager
                .shared
                .request(target: .dogWalking, responseClass: AdvertResult.self)
            return response
        }catch{
            throw error
        }
    }
    
    func fetchSitterAdverts() async throws -> AdvertResult {
        do {
            let response = try await NetworkManager
                .shared
                .request(target: .sitting, responseClass: AdvertResult.self)
            
            return response
            
        }catch{
            throw error
        }

    }
}
