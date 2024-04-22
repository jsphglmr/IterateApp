//
//  SettingsCellView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 4/18/24.
//

import SwiftUI

struct SettingsCellView: View {
    
    let image: String
    let foregroundColor: Color
    let backgroundColor: Color
    let title: String
    let link: String?
    
    var body: some View {
        HStack(alignment: .center) {
            iconView
            if link != nil {
                Link(title, destination: URL(string: link ?? "www.apple.com")!)
                    .foregroundStyle(.foreground)
            } else {
                Text(title)
            }
        }
    }
}

extension SettingsCellView {
    var iconView: some View {
        ZStack {
            Image(systemName: image)
                .foregroundStyle(.white)
        }
        .frame(width: 30, height: 30, alignment: .center)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.vertical, 5)
    }
}


#Preview {
    SettingsCellView(image: "heart.fill", foregroundColor: .red, backgroundColor: .red, title: "test title", link: "www.apple.com")
}
