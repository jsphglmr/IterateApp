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
                Button {
                    //action
                } label: {
                    HStack(alignment: .center) {
                        Image(systemName: "person")
                        Text("About")
                    }
                }
                Text("about")
                Text("about")
            }
        }
    }
}

#Preview {
    SettingsView()
}
