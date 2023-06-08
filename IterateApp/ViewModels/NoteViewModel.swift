//
//  ContentView-ViewModel.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import Foundation

@MainActor class NoteViewModel: ObservableObject {
    @Published var name = ""
    @Published var showingNewNoteView = false
    @Published var notes: [Note] = []
    @Published var selectedNote: Note?
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNotes")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func update() {
        do {
            let data = try Data(contentsOf: savePath)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = []
        }
    }
    
    func addNote(title: String, symbol: String) {
        let newNote = Note(id: UUID(), title: title, symbol: symbol, body: "", date: Date.now)
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
}

