//
//  Note.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import Foundation

struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var symbol: String
    var body: String
    var date: Date
}

extension Note {
    static public var testNote = Note(id: UUID(), title: "Note1 Title", symbol: "pencil", body: "Note1 Body", date: Date())
    static public var testNoteArray = [
        
            Note(id: UUID(),
                 title: "Note1 Title",
                 symbol: "pencil",
                 body: "Note1 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note2 Long Title Test Test Test Test Test Test Test",
                 symbol: "pencil.circle.fill",
                 body: "Note2 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note3 Title",
                 symbol: "pencil",
                 body: "Note3 Body",
                 date: Date()),
        
            Note(id: UUID(),
                 title: "Note4 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note4 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note5 Title",
                 symbol: "pencil",
                 body: "Note5 Body",
                 date: Date()),

            Note(id: UUID(),
                 title: "Note6 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note6 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note7 Title",
                 symbol: "pencil",
                 body: "Note7 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note8 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note8 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note9 Title",
                 symbol: "pencil",
                 body: "Note9 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note10 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note10 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note11 Title",
                 symbol: "pencil",
                 body: "Note11 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note12 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note12 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note13 Title",
                 symbol: "pencil",
                 body: "Note13 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note14 Title",
                 symbol: "pencil.circle.fill",
                 body: "Note14 Body",
                 date: Date())
    ]
}
