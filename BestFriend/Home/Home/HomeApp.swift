import DependencyKit
import HomeModul
import SwiftUI

@main
struct HomeApp: App {
    var body: some Scene {
        WindowGroup {
            AnyView(register())
        }
    }
    
    func register() -> any View {
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModulInterface.self)
        @Dependency var homeModule : HomeModulInterface
        return homeModule.createView()
        
    }
}
