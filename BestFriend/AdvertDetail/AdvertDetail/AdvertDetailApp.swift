import SwiftUI
import DependencyKit
import AdvertDetailModul

@main
struct AdvertDetailApp: App {
    var body: some Scene {
        WindowGroup {
           AnyView(register())
        }
    }
    func register() -> any View {
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: AdvertDetailRouter(), for: AdvertDetailModulInterface.self)
        @Dependency var advertDetailModul : AdvertDetailModulInterface
        return advertDetailModul.createView()
        
    }
}
