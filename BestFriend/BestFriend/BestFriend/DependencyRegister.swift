import Foundation
import DependencyKit
import HomeModul
final class DependencyRegister {
    func register() {
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModulInterface.self)
    }
}
