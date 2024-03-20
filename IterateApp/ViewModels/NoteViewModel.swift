//
//  ContentView-ViewModel.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

@MainActor class NoteViewModel: ObservableObject {
    
    @Published var goals: [Goal] = []
    
    ///Current Selections
    @Published var selectedGoal: Goal?
    
    ///New Note Idea
    @Published var noteTitle = ""
    @Published var noteDescription = ""
    @Published var noteTag = "Education"
    @Published var symbol = "pencil"
    @Published var noteColor = "red"
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNotes")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            goals = try JSONDecoder().decode([Goal].self, from: data)
        } catch {
            if goals.isEmpty {
                goals = []
            } else {
                return
            }
        }
    }
    
    //MARK: - FileManager CRUD
    private func save() {
        do {
            let data = try JSONEncoder().encode(goals)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func refreshData() {
        do {
            let data = try Data(contentsOf: savePath)
            goals = try JSONDecoder().decode([Goal].self, from: data)
        } catch {
            if goals.isEmpty {
                goals = []
            } else {
                return
            }
        }
    }
    
    //MARK: - Note CRUD
    func addNoteIdea(title: String, description: String, symbol: String) {
        let newNote = Goal(title: title, description: description, symbol: symbol, accentColor: noteColor, notes: [], creationDate: Date.now)
        goals.append(newNote)
        save()
    }
    
    func updateNoteIdea(note: Goal) {
        guard let selectedNote = selectedGoal else { return }
        if let index = goals.firstIndex(of: selectedNote) {
            goals[index] = note
            save()
        }
    }
    
    //delete entire note
    func deleteNoteIdea(at offsets: IndexSet) {
        for offset in offsets {
            goals.remove(at: offset)
            save()
        }
    }
    
    //MARK: - Iteration CRUD
    
    //add iteration
    func addIteration(noteIdea: Goal) {
        var currentNote = noteIdea
//        currentNote.notes.append(newIteration)
        guard let index = goals.firstIndex(of: noteIdea) else { return }
        goals[index] = currentNote
        save()
    }
    
    func addNote(_ note: Note, to goal: Goal) {
        guard let index = goals.firstIndex(of: goal) else { return }
        var updatedGoal = goals[index]
        updatedGoal.notes.insert(note, at: 0)
        goals[index] = updatedGoal
        save()
    }
    
    //update specific iteration
    func updateIteration(note: Note) {
//        guard let selectedIteration = selectedIteration else { return }
//
//        save()
    }
    
    //remove specific iteration
    func removeIteration(noteIdea: Goal, at offsets: IndexSet) {
        var currentNote = noteIdea
        for offset in offsets {
            currentNote.notes.remove(at: offset)
            save()
        }
    }
}

