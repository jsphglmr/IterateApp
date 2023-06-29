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
            .overlay(alignment: .bottomLeading) {
                Button {
                    viewModel.showingNewNoteView.toggle()
                } label: {
                    Text("New Note")
                    Image(systemName: "plus.circle.fill")
                }
                .frame(height: 65)
                .frame(width: 200)
                .background(.thinMaterial)
                .shadow(color: .white.opacity(0.3), radius: 6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 45)
                .padding(.bottom, 20)
                .font(.title2)
                .bold()
                
                .sheet(isPresented: $viewModel.showingNewNoteView) {
                    viewModel.refreshData()
                } content: {
                    NewNoteView()
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
