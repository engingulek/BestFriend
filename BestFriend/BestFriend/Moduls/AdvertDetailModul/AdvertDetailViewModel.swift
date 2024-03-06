import Foundation

class AdvertDetailViewModel : ObservableObject{
    @Published var comments : [(key:String,value:CommentValue)] = []
    
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
                   guard let result else {
                       comments = []
                       message = TextConstants.noCommentForAdvert.rawValue
                       return}
                   for (key,value) in result {
                       comments.append((key,value))
                       comments = comments.sorted(by: {$0.key < $1.key})
                       message = ""
                       
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


