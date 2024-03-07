import Foundation

protocol AdvertDetailServiceProtocol {
    func fetchComments(advertId:String)  async throws -> CommentResult?
}


class AdvertDetailService : AdvertDetailServiceProtocol {
    static let shared = AdvertDetailService()
    func fetchComments(advertId: String) async throws -> CommentResult? {
        do {
            let response = try await NetworkManager
                .shared
                .request(target: .comments(advertId), responseClass: CommentResult?.self)
            return response
        }catch{
            throw error
        }
    }
}
