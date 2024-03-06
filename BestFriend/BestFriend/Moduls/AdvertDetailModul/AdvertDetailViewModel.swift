import Foundation

enum CommentSortType : String, CaseIterable {
    case normal = "Normal"
    case fromOldToNew = "From Old To New"
    case fromNewToOld = "From New To Old"
}



class AdvertDetailViewModel : ObservableObject{
    private var comments : [(key:String,value:CommentValue)] = []
    @Published var commentList : [(key:String,value:CommentValue)] = []
    
    @Published var message: String = ""
    @Published var commentSortType : CommentSortType = .normal
    private let service : AdvertDetailServiceProtocol
    
    init(service : AdvertDetailServiceProtocol = AdvertDetailService.shared){
        self.service = service
    }
    
    func onAppear(advertId:String){
        fetchComments(advertId: advertId)
    }
    
    
    func sortComment() {
        switch commentSortType {
        case .normal:
            commentList = comments
        case .fromOldToNew:
            commentList = comments.sorted(by: {$0.value.date.toConvertDate() < $1.value.date.toConvertDate() })
        case .fromNewToOld:
            commentList = comments.sorted(by: {$0.value.date.toConvertDate() > $1.value.date.toConvertDate() })
        }
    }
    
    
   private func fetchComments(advertId:String) {
       Task{
          
           do {
               
               let result = try await service.fetchComments(advertId: advertId)
               DispatchQueue.main.async { [weak self] in
                   guard let self = self else {return}
                   guard let result else {
                       comments = []
                       commentList = comments
                       message = TextConstants.noCommentForAdvert.rawValue
                       return}
                   for (key,value) in result {
                       comments.append((key,value))
                       comments = comments.sorted(by: {$0.key < $1.key})
                       commentList = comments
                       message = ""
                       
                   }
                  
               }

           }catch{
               DispatchQueue.main.async { [weak self] in
                   guard let self = self else {return}
                   comments = []
                   commentList = comments
                   message = TextConstants.errorMessage.rawValue
               }
           }
          
       }
    }
}


