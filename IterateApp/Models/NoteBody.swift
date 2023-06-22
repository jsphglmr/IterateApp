//
//  NoteBody.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/21/23.
//

import Foundation

struct NoteBody: Codable, Identifiable, Equatable {
    var id: UUID
    var body: String
    var date: Date
}

///Test Note Bodies
extension NoteBody {
    static public let testNoteBodies: [NoteBody] = [
        NoteBody(id: UUID(), body: "Test Body 1", date: Date.now),
        NoteBody(id: UUID(), body: "Test Body 2", date: Date.now),
        NoteBody(id: UUID(), body: "Test Body 3", date: Date.now),
        NoteBody(id: UUID(), body: "Test Body 4", date: Date.now),
        NoteBody(id: UUID(), body: "Test Body 5", date: Date.now),
    ]
}
