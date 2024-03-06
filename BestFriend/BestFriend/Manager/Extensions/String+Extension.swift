import Foundation

extension String {
    func toConvertDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else {
            return Date.now
        }
        return date
        
    }
}
