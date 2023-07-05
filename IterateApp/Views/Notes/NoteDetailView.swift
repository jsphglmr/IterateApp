//
//  NoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/20/23.
//

import SwiftUI

struct NoteDetailView: View {
    @StateObject private var viewModel = NoteViewModel()
    
    var note: NoteIdea
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.title2)
                            .foregroundColor(Color(colorName: note.accentColor))
                            .bold()
                        Divider()
                        Text(note.description)
                            .font(.title3)
                    }
                }
                
                Section {
                    HStack {
                        TextField("New Note Textfield", text: $viewModel.newIteration.body, prompt: Text("New Iteration..."), axis: .vertical)
                            .onSubmit {
                                //MARK: - add to notes array
                                viewModel.addIteration(noteIdea: note)
                                viewModel.newIteration = Note(body: "")
                                viewModel.objectWillChange.send()
                            }
                        Button {
                            // ‼️ add iteration to array
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color(colorName: note.accentColor))
                        }
                    }
                } footer: {
                    VStack(alignment: .trailing) {
                        Text("Characters: \(viewModel.newIteration.body.count)/280")
                            .foregroundColor(.secondary)
                    }
                }
                
                ForEach(note.notes) { iteration in
                    Section {
                        VStack(alignment: .leading){
                            Text(iteration.body)
                        }
                    } footer: {
                        Text(iteration.formattedDate)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        //edit
                    } label: {
                        Label("Edit", systemImage: "ellipsis.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(colorName: note.accentColor))
                            .shadow(color: .white.opacity(1), radius: 20)
                    }
                }
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: NoteIdea.testNoteArray[1])
            .preferredColorScheme(.dark)
        
    }
}
