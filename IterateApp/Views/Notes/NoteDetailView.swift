//
//  NoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/20/23.
//

import SwiftUI

struct NoteDetailView: View {
    @StateObject var viewModel = NoteViewModel()
    
    @State var goal: Goal
    
    @State var newIterationBody: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text(goal.title)
                            .font(.title2)
                            .foregroundColor(Color(colorName: goal.accentColor))
                            .bold()
                        Divider()
                        Text(goal.description)
                            .font(.title3)
                    }
                }
                
                Section {
                    TextField("New Note", text: $newIterationBody, prompt: Text("hello"))
                    
                        .onSubmit {
                            //MARK: - add to notes array
                            let newNote = Note(body: newIterationBody)
                            viewModel.addNote(newNote, to: goal)
                            goal.notes.insert(newNote, at: 0)
                            newIterationBody = ""
                            print(viewModel.goals)
                        }
                } footer: {
                    VStack(alignment: .trailing) {
                        Text("Characters: \(newIterationBody.count)/280")
                            .foregroundColor(.secondary)
                    }
                }
                
                ForEach(goal.notes) { note in
                    Section {
                        VStack(alignment: .leading){
                            Text(note.body)
                        }
                    } footer: {
                        Text(note.formattedDate)
                    }
                }
                .onDelete { indexSet in
                    viewModel.removeIteration(noteIdea: goal, at: indexSet)
                }
                .refreshable {
                    viewModel.refreshData()
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        // ‼️ TODO -- add button functionality
                        viewModel.refreshData()
                    } label: {
                        Label("Edit", systemImage: "ellipsis.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(colorName: goal.accentColor))
                            .shadow(color: .white.opacity(1), radius: 20)
                    }
                }
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(goal: Goal.testNoteArray[1])
            .preferredColorScheme(.dark)
        
    }
}
