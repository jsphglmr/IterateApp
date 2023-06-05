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
    @StateObject private var viewModel = NoteViewModel()
    
    @State private var noteTitle = ""
    @State private var noteTag = "Education"
    
    @State private var iconPickerPresented = false
    @State private var symbol = "pencil"
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("Develop iOS app for...", text: $noteTitle)
                        .multilineTextAlignment(.leading)
                }
                
                Section("Symbol") {
                    Button {
                        iconPickerPresented = true
                    } label: {
                        HStack {
                            Image(systemName: symbol)
                            Text(symbol)
                        }
                    }
                    .sheet(isPresented: $iconPickerPresented) {
                        SymbolPicker(symbol: $symbol)
                    }
                }
                
                Button("Add") {
                    viewModel.addNote(title: noteTitle, symbol: symbol)
                    dismiss()
                }
            }
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            .preferredColorScheme(.dark)
    }
}
