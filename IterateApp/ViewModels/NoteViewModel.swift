//
//  ContentView-ViewModel.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

@MainActor class NoteViewModel: ObservableObject {
    
    @Published var showingNewNoteView = false
    @Published var notes: [NoteIdea] = []
    
    ///Current Selections
    @Published var selectedNote: NoteIdea?
    @Published var selectedIteration: Note?
    
    ///New Note Idea
    @Published var noteTitle = ""
    @Published var noteDescription = ""
    @Published var noteTag = "Education"
    @Published var symbol = "pencil"
    @Published var noteColor = "red"
    
    ///New Iterations
    @Published var newIteration = Note(body: "", creationDate: Date.now)
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNotes")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            notes = try JSONDecoder().decode([NoteIdea].self, from: data)
        } catch {
            notes = []
        }
    }
    //MARK: - FileManager CRUD
    private func save() {
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
            notes = try JSONDecoder().decode([NoteIdea].self, from: data)
        } catch {
            notes = []
        }
    }
    
    //MARK: - Note CRUD
    func addNoteIdea(title: String, description: String, symbol: String) {
        let newNote = NoteIdea(title: title, description: description, symbol: symbol, accentColor: noteColor, notes: [], creationDate: Date.now)
        notes.append(newNote)
        save()
    }
    
    func updateNoteIdea(note: NoteIdea) {
        guard let selectedNote = selectedNote else { return }
        if let index = notes.firstIndex(of: selectedNote) {
            notes[index] = note
            save()
        }
    }
    
    //delete entire note
    func deleteNoteIdea(at offsets: IndexSet) {
        for offset in offsets {
            notes.remove(at: offset)
            save()
        }
    }
    
    //MARK: - Iteration CRUD
    
    //add iteration
    func addIteration(noteIdea: NoteIdea) {
        var currentNote = noteIdea
        currentNote.notes.append(newIteration)
        guard let index = notes.firstIndex(of: noteIdea) else { return }
        notes[index] = currentNote
        save()
        print(notes)
        print(currentNote)
    }
    
    //update specific iteration
    func updateIteration(note: Note) {
//        guard let selectedIteration = selectedIteration else { return }
//
//        save()
    }
    
    //remove specific iteration
    func removeIteration() {
        
        save()
    }
}

