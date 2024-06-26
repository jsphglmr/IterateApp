//
//  NoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/20/23.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct NoteDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var goal: Goal
    @State private var newIterationBody: String = ""
    @State private var iconPickerPresented = false
    @State private var isSortedByNewest = false
    let textFieldLimit = 280
    
    var notesSortedbyNewest: [Note] {
        goal.notes.sorted { $0.creationDate > $1.creationDate }
    }
    
    var notesSortedByOldest: [Note] {
        goal.notes.sorted { $0.creationDate < $1.creationDate }
    }
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    HStack {
                        Button {
                            iconPickerPresented = true
                        } label: {
                            Image(systemName: goal.symbol)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(colorName: goal.accentColor))
                        }
                        .sheet(isPresented: $iconPickerPresented) {
                            SymbolPicker(symbol: $goal.symbol)
                        }

                        TextField(goal.title, text: $goal.title)
                            .font(.title2)
                            .foregroundColor(Color(colorName: goal.accentColor))
                            .bold()
                    }
                    Divider()
                    TextField(goal.info, text: $goal.info)
                        .font(.title3)
                }
            }
            
            Section {
                TextField("New Note", text: $newIterationBody, prompt: Text("New idea..."))
                    .onChange(of: newIterationBody) { text, newValue in
                        self.newIterationBody = String(text.prefix(textFieldLimit))
                        
                    }
                    .onSubmit {
                        let newNote = Note(body: newIterationBody)
                        goal.notes.append(newNote)
                        newIterationBody = ""
                    }
            } footer: {
                VStack(alignment: .trailing) {
                    Text("Characters: \(newIterationBody.count)/280")
                        .foregroundColor(.secondary)
                }
            }
            
            Section {
                if isSortedByNewest {
                    ForEach(notesSortedbyNewest) { note in
                        IterationBodyCellView(note: note, color: goal.accentColor)
                    }
                    //MARK: - Fix delete
                    //deleting causes app to crash when view is reloaded
                    .onDelete(perform: deleteNoteIdea)
                } else {
                    ForEach(notesSortedByOldest) { note in
                        IterationBodyCellView(note: note, color: goal.accentColor)
                    }
                    //MARK: - Fix delete
                    //deleting causes app to crash when view is reloaded
                    .onDelete(perform: deleteNoteIdea)
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    isSortedByNewest.toggle()
                } label: {
                    if isSortedByNewest {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    } else {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                    }
                }
                .foregroundColor(Color(colorName: goal.accentColor))

            }
        }
        
    }
    
    func deleteNoteIdea(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(goal.notes[index])
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(goal: Goal(title: "asdf", description: "1234", symbol: "pencil", accentColor: "red", notes: [Note(body: "test")], creationDate: .now))
            .preferredColorScheme(.dark)
        
    }
}
