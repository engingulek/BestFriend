
import Foundation

public final class DependencyEngine {
    // If it want to call interface of any module, Complex is decreased
    var dependencies : [ObjectIdentifier: () -> Any] = [:]
    public static let shared = DependencyEngine()
    
    init() {}
    
    /// register
    /// - Parameters:
    ///   - value: Modul
    ///   - interface: key of Modul
    ///   dec : This function is first add the interface and module to dictionary
    public func register(value: @autoclosure @escaping () -> Any,for interface:Any.Type){
        dependencies[ObjectIdentifier(interface)] = value
    }
   // If Any Module want to call any module, it will call with dictionary
    public func read<Value>(for interface : Any.Type) -> Value {
        guard let value = dependencies[ObjectIdentifier(interface)]?() as? Value else {
            fatalError("Implementation for \(interface) is not found")
        }
        return value
        
    }
}
