//
//  Color+ColorString.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/12/23.
//

import Foundation
import SwiftUI

extension Color {
    init?(colorName: String) {
        switch colorName {
        case "red":
            self = .red
        case "orange":
            self = .orange
        case "yellow":
            self = .yellow
        case "green":
            self = .green
        case "blue":
            self = .blue
        case "indigo":
            self = .indigo
        case "purple":
            self = .purple
        default:
            self = .red
        }
    }
}
