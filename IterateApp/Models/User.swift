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

struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var body: String
    var date: Date
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

extension Note {
    static public var testNote = Note(id: UUID(), title: "Note1 Title", body: "Note1 Body", date: Date())
    static public var testNoteArray = [
        
            Note(id: UUID(),
                 title: "Note1 Title",
                 body: "Note1 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note2 Title",
                 body: "Note2 Body",
                 date: Date()),
        
            Note(id: UUID(),
                 title: "Note4 Title",
                 body: "Note4 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note5 Title",
                 body: "Note5 Body",
                 date: Date()),

            Note(id: UUID(),
                 title: "Note6 Title",
                 body: "Note6 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note7 Title",
                 body: "Note7 Body",
                 date: Date())
    ]
}
