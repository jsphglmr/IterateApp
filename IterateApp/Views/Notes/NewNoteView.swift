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
    @State private var noteColor = Color.blue
    
    var defaultColor: Color {
        let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
        return colors.randomElement() ?? Color.red
    }
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("Develop iOS app for...", text: $noteTitle)
                        .multilineTextAlignment(.leading)
                }
                
                Section("Customize") {
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
                    
                    
                    ColorPicker("Note Color", selection: $noteColor)
                        .padding(.trailing)
                        .foregroundColor(noteColor)
                        
                    
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
