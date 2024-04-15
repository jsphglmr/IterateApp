//
//  NoteBody.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/21/23.
//

import SwiftUI
import SwiftData

@Model
final class Note {
    var id = UUID()
    var body: String
    var creationDate = Date.now
    
    init(id: UUID = UUID(), body: String, creationDate: Date = Date.now) {
        self.id = id
        self.body = body
        self.creationDate = creationDate
    }
}
