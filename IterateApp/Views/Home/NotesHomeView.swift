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
                }
                .onDelete(perform: viewModel.deleteNoteIdea)
                .refreshable {
                    viewModel.refreshData()
                }
            }
            .navigationTitle("Iterate")
            .toolbar {
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        viewModel.showingNewNoteView = true
                    } label: {
                        HStack {
                            Text("New Note")
                                .font(.title3)
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        }
                        .bold()
                        .buttonStyle(.borderedProminent)

                        .sheet(isPresented: $viewModel.showingNewNoteView) {
                            viewModel.refreshData()
                        } content: {
                            NewNoteView()
                        }
                        .padding(.bottom)
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
