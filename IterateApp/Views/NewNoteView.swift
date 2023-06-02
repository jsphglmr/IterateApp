//
//  NewNoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/22/23.
//

import SwiftUI
import SymbolPicker

struct NewNoteView: View {
    @Environment(\.dismiss) var dismiss

    @State private var noteTitle = ""
    @State private var noteTag = "Education"
    
    @State private var iconPickerPresented = false
    @State private var icon = "pencil"
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("Develop iOS app for...", text: $noteTitle)
                }
                
                Section("Symbol") {
                    


                        Button {
                            iconPickerPresented = true
                        } label: {
                            HStack {
                                Image(systemName: icon)
                                Text(icon)
                            }
                        }
                        .sheet(isPresented: $iconPickerPresented) {
                            SymbolPicker(symbol: $icon)
                        }
                    
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
