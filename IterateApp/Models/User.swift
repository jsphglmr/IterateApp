//
//  User.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var name: String
    var email: String
    var registered: Date
    var tags: [String]
    var notes: [Note]
}

extension User {
    
    static public var testUser = User(
        id: UUID(),
        name: "Firstname Lastname",
        email: "test@email.com",
        registered: Date(),
        tags: ["tag1", "tag2", "tag3"],
        notes: [
            Note(id: UUID(),
                 title: "Note1 Title",
                 body: "Note1 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note2 Title",
                 body: "Note2 Body",
                 date: Date())
        ])
}
