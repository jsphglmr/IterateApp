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
    var body: String
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
    
    static public let testNote = Note(id: UUID(), title: "Note1 Title", description: "Test description", symbol: "pencil", body: "Note1 Body", creationDate: Date())
    static public let testNoteArray = [
        
            Note(id: UUID(),
                 title: "Note1 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note1 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note2 Long Title Test Test Test Test Test Test Test",
                 description: "Test long long long description Test Test Test Test Test Test Test",
                 symbol: "pencil.circle.fill",
                 body: "Note2 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note3 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note3 Body",
                 creationDate: Date()),
        
            Note(id: UUID(),
                 title: "Note4 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note4 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note5 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note5 Body",
                 creationDate: Date()),

            Note(id: UUID(),
                 title: "Note6 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note6 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note7 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note7 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note8 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note8 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note9 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note9 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note10 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note10 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note11 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note11 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note12 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note12 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note13 Title",
                 description: "Test description",
                 symbol: "pencil",
                 body: "Note13 Body",
                 creationDate: Date()),
            
            Note(id: UUID(),
                 title: "Note14 Title",
                 description: "Test description",
                 symbol: "pencil.circle.fill",
                 body: "Note14 Body",
                 creationDate: Date())
    ]
}
