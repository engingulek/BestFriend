import SwiftUI
import DependencyKit
import HomeModul


@main
struct BestFriendApp: App {
    var body: some Scene {
        WindowGroup {
            AnyView(register())
        }
    }
     
    func register() -> any View {
        let dependenyRegister = DependencyRegister()
        dependenyRegister.register()
        @Dependency var homeModule : HomeModulInterface
        return homeModule.createView()
    }
}