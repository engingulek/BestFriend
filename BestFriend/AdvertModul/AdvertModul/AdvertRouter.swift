import Foundation
import SwiftUI
public class AdvertRouter : AdvertModulInterface {
    public init(){}
    public func createView() -> any View {
        let view = AdvertView()
        return view
    }
}
