//
//  IterateAppApp.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import SwiftUI
import SwiftData

@main
struct IterateAppApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    //swift data implementation
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
            Goal.self,
            Note.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color(red: 0.1, green: 0.1, blue: 0.2))
                .preferredColorScheme(.dark)
        }
        .modelContainer(sharedModelContainer)

    }
}
