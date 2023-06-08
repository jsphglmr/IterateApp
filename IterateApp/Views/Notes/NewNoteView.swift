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
    
    @State private var iconPickerPresented = false
    
    let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
    
    var defaultColor: Color {
        return colors.randomElement() ?? Color.blue
    }
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("A new way to...", text: $viewModel.noteTitle)
                        .multilineTextAlignment(.leading)
                }
                
                Section("Description") {
                    TextField("The goal of this is...", text: $viewModel.noteDescription)
                        .multilineTextAlignment(.leading)

                }
                
                Section("Customize") {
                    Button {
                        iconPickerPresented = true
                    } label: {
                        HStack {
                            Image(systemName: viewModel.symbol)
                            Text(viewModel.symbol)
                        }
                        .tint(defaultColor)
                    }
                    .sheet(isPresented: $iconPickerPresented) {
                        SymbolPicker(symbol: $viewModel.symbol)
                    }
                }
                
                Button("Add") {
                    viewModel.addNote(title: viewModel.noteTitle, description: viewModel.noteDescription, symbol: viewModel.symbol)
                    dismiss()
                }
            }
            .foregroundColor(defaultColor)
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
