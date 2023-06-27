//
//  NoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/20/23.
//

import SwiftUI

struct NoteDetailView: View {
    @StateObject private var viewModel = NoteViewModel()
    
    let note: NoteIdea
    
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
                    VStack {
                        TextField("New Note Textfield", text: $viewModel.newIteration.body, prompt: Text("New Iteration..."), axis: .vertical)
                            .onSubmit {
                                let iteration = Note(id: UUID(), body: viewModel.newIteration.body, creationDate: Date.now)
                                viewModel.updateNoteIdea(note: note)
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
        }
    }
}




struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: NoteIdea.testNoteArray[1])
            .preferredColorScheme(.dark)
        
    }
}
