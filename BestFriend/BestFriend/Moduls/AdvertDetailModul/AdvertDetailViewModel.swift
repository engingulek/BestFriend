import Foundation

class AdvertDetailViewModel : ObservableObject{
    @Published var comments : [(key:String,value:CommmentValue)] = []
    
    @Published var message: String = ""
    private let service : AdvertDetailServiceProtocol
    
    init(service : AdvertDetailServiceProtocol = AdvertDetailService.shared){
        self.service = service
    }
    
    func onAppear(advertId:String){
        fetchComments(advertId: advertId)
    }
    
    
   private func fetchComments(advertId:String) {
       Task{
          
           do {
               
               let result = try await service.fetchComments(advertId: advertId)
               DispatchQueue.main.async { [weak self] in
                   guard let self = self else {return}
                   if result.isEmpty {
                       comments = []
                       message = TextConstants.noCommentForAdvert.rawValue
                   }else{
                       for (key,value) in result {
                           comments.append((key,value))
                           message = ""
                           
                       }
                   }
               }

           }catch{
               DispatchQueue.main.async { [weak self] in
                   guard let self = self else {return}
                   comments = []
                   message = TextConstants.errorMessage.rawValue
               }
           }
          
       }
    }
}


