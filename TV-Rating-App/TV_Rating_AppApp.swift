//
//  TV_Rating_AppApp.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/3/23.
//

import SwiftUI

@main
struct TV_Rating_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
