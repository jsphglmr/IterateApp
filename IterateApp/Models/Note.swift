//
//  Note.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import Foundation

struct Note: Codable, Identifiable, Equatable {
    var id: UUID
    var title: String
    var description: String
    var symbol: String
    var accentColor: String
    var body: [NoteBody]
    var creationDate: Date
}

///Computed properties
extension Note {
    var formattedDate: String {
        let newDate = creationDate.formatted(
            .dateTime
                .month(.abbreviated).day(.defaultDigits).year(.twoDigits)
                .hour(.defaultDigits(amPM: .abbreviated)))
        return newDate
    }
}

/// Test Note Data
extension Note {
    static public let testNote = Note(id: UUID(), title: "Note1 Title", description: "Test description", symbol: "pencil", accentColor: "red", body: NoteBody.testNoteBodies, creationDate: Date())
    static public let testNoteArray = [
        
            Note(id: UUID(),
                 title: "Note1 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note2 Long Title Test Test Test Test Test Test Test",
                 description: "Test long long long description Test Test Test Test Test Test Test",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note3 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
        
            Note(id: UUID(),
                 title: "Note4 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note5 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),

            Note(id: UUID(),
                 title: "Note6 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note7 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note8 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note9 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note10 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note11 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note12 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note13 Title",
                 description: "Test description",
                 symbol: "pencil",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note14 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 accentColor: "red",
                 body: NoteBody.testNoteBodies,
                 creationDate: Date())
    ]
}
