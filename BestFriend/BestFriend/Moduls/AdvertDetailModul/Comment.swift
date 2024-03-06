import Foundation

// MARK: - WelcomeValue
struct CommentValue: Codable {
    let comment, date: String
    let userImageURL: String
    let userName: String

    enum CodingKeys: String, CodingKey {
        case comment, date
        case userImageURL = "userImageUrl"
        case userName
    }
    
    static let defaultcommnetValue : CommentValue = .init(comment: "", date: "", userImageURL: "", userName: "")
}

typealias CommentResult = [String:  CommentValue]
