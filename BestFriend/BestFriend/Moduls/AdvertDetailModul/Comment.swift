import Foundation

// MARK: - WelcomeValue
struct CommmentValue: Codable {
    let comment, date: String
    let userImageURL: String
    let userName: String

    enum CodingKeys: String, CodingKey {
        case comment, date
        case userImageURL = "userImageUrl"
        case userName
    }
}

typealias CommentResult = [String:  CommmentValue]
