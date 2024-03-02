import SwiftUI
import DependencyKit
import AdvertModul

@main
struct AdvertApp: App {
    var body: some Scene {
        WindowGroup {
          AnyView(register())
        }
    }
    
    func register() -> any View {
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: AdvertRouter(), for: AdvertModulInterface.self)
        @Dependency var adverModule : AdvertModulInterface
        return adverModule.createView()
        
    }
}
