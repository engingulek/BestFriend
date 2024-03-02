import Foundation
import DependencyKit
import HomeModul
import AdvertModul
final class DependencyRegister {
    func register() {
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModulInterface.self)
        dependencyRegister.register(value: AdvertRouter(), for: AdvertModulInterface.self)
    }
}
