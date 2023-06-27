//
//  NoteBody.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/21/23.
//

import Foundation

struct Note: Codable, Identifiable, Equatable {
    var id: UUID
    var body: String
    var date: Date
}

///Test Note Bodies
extension Note {
    static public let testBody = Note(id: UUID(), body: "Test body", date: Date.now)
    static public let testBodyArray = [
        Note(id: UUID(), body: "Test body1", date: Date.now),
        Note(id: UUID(), body: "Test body2", date: Date.now),
        Note(id: UUID(), body: "Test body3", date: Date.now),
        Note(id: UUID(), body: "Test body4", date: Date.now),
        Note(id: UUID(), body: "Test body5", date: Date.now)
    ]
}
