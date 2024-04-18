//
//  SettingsCellView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 4/18/24.
//

import SwiftUI

struct SettingsCellView: View {
    
    let image: String
    let color: Color
    let title: String
    let link: String?
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: image)
                .tint(color)
            if link != nil {
                Link(title, destination: URL(string: link ?? "www.apple.com")!)
                    .foregroundStyle(.foreground)
            } else {
                Text(title)
            }
        }
    }
}


#Preview {
    SettingsCellView(image: "heart.fill", color: .red, title: "test title", link: "www.apple.com")
}
