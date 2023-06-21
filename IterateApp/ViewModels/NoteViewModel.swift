//
//  ContentView-ViewModel.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

@MainActor class NoteViewModel: ObservableObject {
    
    @Published var showingNewNoteView = false
    @Published var notes: [Note] = []
    @Published var selectedNote: Note?
    
    ///New Notes
    @Published var noteTitle = ""
    @Published var noteDescription = ""
    @Published var noteTag = "Education"
    @Published var symbol = "pencil"
    @Published var noteColor = "red"
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNotes")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = []
        }
    }
    //MARK: - FileManager CRUD
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func refreshData() {
        do {
            let data = try Data(contentsOf: savePath)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = []
        }
    }
    
    //MARK: - Note CRUD
    func addNote(title: String, description: String, symbol: String) {
        let newNote = Note(id: UUID(), title: title, description: description, symbol: symbol, accentColor: noteColor, body: "", creationDate: Date.now)
        notes.append(newNote)
        save()
    }
    
    func update(note: Note) {
        guard let selectedNote = selectedNote else { return }
        if let index = notes.firstIndex(of: selectedNote) {
            notes[index] = note
            save()
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            notes.remove(at: offset)
            save()
        }
    }
}

