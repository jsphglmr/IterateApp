//
//  Note.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import Foundation
import SwiftData

@Model
final class Goal {
    var id = UUID()
    var title: String
    var info: String
    var symbol: String
    var accentColor: String
    var notes: [Note]
    var creationDate: Date
    
    init(id: UUID = UUID(), title: String, description: String, symbol: String, accentColor: String, notes: [Note], creationDate: Date) {
        self.id = id
        self.title = title
        self.info = description
        self.symbol = symbol
        self.accentColor = accentColor
        self.notes = notes
        self.creationDate = creationDate
    }
}

///Computed Properties
extension Goal {
    var formattedDate: String {
        let newDate = creationDate.formatted(
            .dateTime
                .month(.abbreviated).day(.defaultDigits).year(.twoDigits)
                .hour(.defaultDigits(amPM: .abbreviated)))
        return newDate
    }
}
