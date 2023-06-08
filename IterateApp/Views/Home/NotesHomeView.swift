//
//  NotesHomeView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/5/23.
//

import SwiftUI

struct NotesHomeView: View {
    @ObservedObject var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id: \.id) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        NoteCellView(note: note)
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: viewModel.deleteNote)
                
                .refreshable {
                    viewModel.refreshData()
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        viewModel.showingNewNoteView = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                        }
                        .bold()
                        .foregroundColor(.red)
                        .buttonStyle(.borderedProminent)

                        .sheet(isPresented: $viewModel.showingNewNoteView) {
                            viewModel.refreshData()
                        } content: {
                            NewNoteView()
                        }
                    }
                }
            }
        }
    }
}

struct NotesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NotesHomeView()
            .preferredColorScheme(.dark)
    }
}
