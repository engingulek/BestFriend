
import Foundation

protocol AdvertsServicProtocol {
    func fetchDogWalkerAdverts(completion:@escaping(Result<[Advert]?,Error>)->())
    func fetchSitterAdverts(completion:@escaping(Result<[Advert]?,Error>)->())
}


class AdvertsService : AdvertsServicProtocol {
    static let shared = AdvertsService()
    func fetchDogWalkerAdverts(completion: @escaping (Result<[Advert]?, Error>) -> ()) {
        let testAdverts:[Advert] = [
            .init(
                id: "1",
                imageUrl: "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?size=626&ext=jpg&ga=GA1.1.1395880969.1709424000&semt=ais",
                nameSurname: "Morgan Ka",
                locationInfo:
                    LocationInfo(
                        city: "Ankara",
                        district: "Keçiören"),
                perWage: 20,info: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', ")
        ]
        completion(.success(testAdverts))
    }
    
    func fetchSitterAdverts(completion: @escaping (Result<[Advert]?, Error>) -> ()) {
        let testAdverts:[Advert] = [
            .init(
                id: "1",
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpZiWi1xT1LY3d1PNOq716UxlcaW_JnfkIM89pd2wM1Fx26vsxiGTWI1CjtixvaGqDZOI&usqp=CAU",
                nameSurname: "Tom Pa",
                locationInfo:
                    LocationInfo(
                        city: "İstanbul",
                        district: "Beylikdüzü"),
                perWage: 30,info: "with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always fr")
        ]
        completion(.success(testAdverts))
        
    }
    
    
}
