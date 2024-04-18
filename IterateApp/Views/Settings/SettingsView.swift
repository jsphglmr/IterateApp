//
//  SettingsView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 4/18/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section {
                SettingsCellView(image: "heart.fill", color: .red, title: "github", link: "github.com")
                SettingsCellView(image: "heart", color: .blue, title: "apple", link: "apple.com")
            }
            
            Section {
                SettingsCellView(image: "brain.fill", color: .yellow, title: "google", link: "google.com")
            }
            
            Section {
                SettingsCellView(image: "brain", color: .purple, title: "Non Link Test", link: nil)
            }
        }
    }
}

#Preview {
    SettingsView()
}
