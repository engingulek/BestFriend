import Foundation
import SwiftUI
public class AdvertDetailRouter : AdvertDetailModulInterface {
    public init(){}
    public func createView() -> any View {
        let view = AdvertDetailView()
        return view
    }
    
    
}
