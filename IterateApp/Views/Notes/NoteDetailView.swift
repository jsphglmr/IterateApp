//
//  NoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/20/23.
//

import SwiftUI

struct NoteDetailView: View {
    @State private var currentNote = ""
    
    let note: Note
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(note.description)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 25)
                    
                    Section("Todays thoughts:") {
                        Text(note.formattedDate)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        TextEditor(text: $currentNote)
                            .lineSpacing(10)
                            .font(.title)
                    }
                }
                .navigationTitle(note.title)
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: Note.testNoteArray[1])
            .preferredColorScheme(.dark)

    }
}
