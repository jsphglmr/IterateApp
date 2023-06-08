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
            VStack(alignment: .leading) {
                Section("New Iteration") {
                    TextEditor(text: $currentNote)
                }
                Text(Date.now.formatted())
            }
            .navigationTitle(note.title)
        }

    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: Note.testNote)
            .preferredColorScheme(.dark)

    }
}
