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
                            
                            Image(systemName: "note.text")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding(5)
                            
                            VStack {
                                Text(note.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(note.date.formatted(.dateTime))
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            
                        }
                        .frame(height: 100)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.secondary))
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
