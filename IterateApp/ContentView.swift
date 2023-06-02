//
//  ContentView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var showingNewNoteView = false
    
    let notes: [Note]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(notes) { note in
//                        Text(note.title)
                        
                        NavigationLink {
                            NoteView(note: note)
                        } label: {
                            NoteItemView(note: note)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding([.horizontal, .bottom])

            }
            .toolbar {
                Button {
                    showingNewNoteView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingNewNoteView) {
                    NewNoteView()
                }
                .navigationTitle("Iterate")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let noteArray = Note.testNoteArray
    static var previews: some View {
        ContentView(notes: noteArray)
            .preferredColorScheme(.dark)
    }
}
