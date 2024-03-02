//
//  BestFriendApp.swift
//  BestFriend
//
//  Created by Engin Gülek on 2.03.2024.
//

import SwiftUI

@main
struct BestFriendApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
