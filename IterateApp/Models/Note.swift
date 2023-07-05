//
//  NoteBody.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/21/23.
//

import Foundation

struct Note: Codable, Identifiable, Equatable {
    var id = UUID()
    var body: String
    var creationDate = Date.now
}

///Computed Properties
extension Note {
    var formattedDate: String {
        let newDate = creationDate.formatted(
            .dateTime
                .month(.wide).day(.defaultDigits).year(.defaultDigits)
        )
        return newDate
    }
}

///Test Note Bodies
extension Note {
    static public let testBody = Note(id: UUID(), body: "Test body", creationDate: Date.now)
    static public let testBodyArray = [
        Note(id: UUID(), body: "Test body1", creationDate: Date.now),
        Note(id: UUID(), body: "Test body2", creationDate: Date.now),
        Note(id: UUID(), body: "Test body3", creationDate: Date.now),
        Note(id: UUID(), body: "Test body4", creationDate: Date.now),
        Note(id: UUID(), body: "Test body5", creationDate: Date.now)
    ]
}
