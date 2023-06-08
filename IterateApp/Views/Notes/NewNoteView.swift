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
    
    var defaultColor: Color {
        let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
        return colors.randomElement() ?? Color.red
    }
    
    let tagTypes = ["Education", "Health", "Personal", "Other"]
    var body: some View {
        
        NavigationView {
            Form {
                Section("Note Title") {
                    TextField("Develop iOS app for...", text: $viewModel.noteTitle)
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
                    }
                    .sheet(isPresented: $iconPickerPresented) {
                        SymbolPicker(symbol: $viewModel.symbol)
                    }
                    
                    
                    ColorPicker("Note Color", selection: $viewModel.noteColor, supportsOpacity: false)
                        .padding(.trailing)
                        .foregroundColor(viewModel.noteColor)
                }
                
                Button("Add") {
                    viewModel.addNote(title: viewModel.noteTitle, symbol: viewModel.symbol)
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
