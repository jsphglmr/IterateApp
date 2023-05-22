//
//  IterateAppApp.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import SwiftUI

@main
struct IterateAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(notes: Note.testNoteArray)
                .preferredColorScheme(.dark)
        }
    }
}
