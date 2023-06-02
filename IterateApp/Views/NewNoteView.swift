//
//  NewNoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/22/23.
//

import SwiftUI

struct NewNoteView: View {
    @State private var noteTitle = ""
    @State private var noteTag = "Education"
    @Environment(\.dismiss) var dismiss
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("Develop iOS app for...", text: $noteTitle)
                }
                
                Section("Tag") {
                    Picker("Tag", selection: $noteTag) {
                        ForEach(tagTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Button("Add") {
                    addNewNote(title: noteTitle, tag: noteTag)
                }
            }
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
    
    func addNewNote(title: String, tag: String) {
        //add note to db
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            .preferredColorScheme(.dark)
    }
}
