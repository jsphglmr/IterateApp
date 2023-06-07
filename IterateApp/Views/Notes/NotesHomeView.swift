//
//  NotesHomeView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/5/23.
//

import SwiftUI

struct NotesHomeView: View {
    
    @ObservedObject var viewModel = NoteViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.notes) { note in
                        NavigationLink {
                            NoteDetailView(note: note)
                        } label: {
                            NoteCellView(note: note)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            
            .refreshable {
                viewModel.update()
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        viewModel.showingNewNoteView = true
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle.fill")
                                
                            Text("New Project")
                                .font(.title)
                        }
                        .bold()
                        .foregroundColor(.red)
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $viewModel.showingNewNoteView) {
                            NewNoteView()
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Iterate")
        }
    }
}

struct NotesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NotesHomeView()
            .preferredColorScheme(.dark)
    }
}
