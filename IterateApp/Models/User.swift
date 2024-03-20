//
//  User.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var email: String
    var registered: Date
    var tags: [String]
    var notes: [Goal]
}

///Test User
extension User {
    
    static public var testUser = User(
        id: UUID(),
        name: "Firstname Lastname",
        email: "test@email.com",
        registered: Date(),
        tags: ["tag1", "tag2", "tag3"],
        notes: [
            Goal(id: UUID(),
                 title: "Note1 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 notes: Note.testBodyArray,
                 creationDate: Date()),
            
            Goal(id: UUID(),
                 title: "Note2 Title",
                 description: "Test description",
                 symbol: "pen",
                 accentColor: "red",
                 notes: Note.testBodyArray,
                 creationDate: Date())
        ])
}
