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
    var body: String
    var date: Date
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
                 title: "Note3 Title",
                 body: "Note3 Body",
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
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note8 Title",
                 body: "Note8 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note9 Title",
                 body: "Note9 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note10 Title",
                 body: "Note10 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note11 Title",
                 body: "Note11 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note12 Title",
                 body: "Note12 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note13 Title",
                 body: "Note13 Body",
                 date: Date()),
            
            Note(id: UUID(),
                 title: "Note14 Title",
                 body: "Note14 Body",
                 date: Date())
    ]
}
