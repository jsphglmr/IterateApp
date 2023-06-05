//
//  ContentView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = NoteViewModel()

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.notes) { note in
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
                    viewModel.showingNewNoteView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewNoteView) {
                    NewNoteView()
                }
                .navigationTitle("Iterate")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let testNoteArray = Note.testNoteArray
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
