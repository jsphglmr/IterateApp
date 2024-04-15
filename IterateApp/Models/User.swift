//
//  User.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import Foundation
import SwiftData

@Model
final class User {
    var id = UUID()
    var name: String
    var email: String
    var registered: Date
    var tags: [String]
    var notes: [Goal]
    
    init(id: UUID = UUID(), name: String, email: String, registered: Date, tags: [String], notes: [Goal]) {
        self.id = id
        self.name = name
        self.email = email
        self.registered = registered
        self.tags = tags
        self.notes = notes
    }
}
