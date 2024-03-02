import Foundation
import SwiftUI

public class HomeRouter : HomeModulInterface {
  
    
    public init(){}
    
    public func createView() -> any View {
        return HomeView()
    }
    
}
