import Foundation

struct Advert {
    let id:String
    let imageUrl:String
    let nameSurname:String
    let locationInfo:LocationInfo
    let perWage:Int
    let info:String
    
    
    static let defaultAdvert = Advert(id: "1", imageUrl: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=2662&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", nameSurname: "Dan Ka", locationInfo: LocationInfo(
        city: "İzmir",
        district: " Foça"), perWage: 10, info: "by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")
}


struct LocationInfo {
    let city:String
    let district:String
}
