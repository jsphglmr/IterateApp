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
                .foregroundColor(.white)
                .ignoresSafeArea()
                .frame(height: 50)
                .frame(width: 175)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 1, green: 1, blue: 1)))
                .shadow(color: .white.opacity(0.5), radius: 3)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
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
