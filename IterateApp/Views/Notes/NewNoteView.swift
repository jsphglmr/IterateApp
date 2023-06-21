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
    
    var allFieldsComplete: Bool {
        viewModel.noteTitle.isEmpty || viewModel.noteDescription.isEmpty || viewModel.noteColor.isEmpty
    }
    
    let colors = ["red", "orange", "yellow", "green", "blue", "indigo", "purple"]
            
    var body: some View {
        
        NavigationView {
            Form {
                titleInput
                goalInput
                iconSelector
                colorSelector
                notePreview
                
                Button("Add") {
                    viewModel.addNote(title: viewModel.noteTitle, description: viewModel.noteDescription, symbol: viewModel.symbol)
                    dismiss()
                }
                .disabled(allFieldsComplete)
            }
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

///Title View
extension NewNoteView {
    var titleInput: some View {
        Section("Note Title") {
            TextField("A new way to...", text: $viewModel.noteTitle)
                .multilineTextAlignment(.leading)
        }
    }
}

///Goal Selector View
extension NewNoteView {
    var goalInput: some View {
        Section("Description") {
            TextField("The goal of this is...", text: $viewModel.noteDescription)
                .multilineTextAlignment(.leading)
        }
    }
}

///Icon Selector View
extension NewNoteView {
    var iconSelector: some View {
        Section("Icon") {
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
        }
    }
}

///Note Preview
extension NewNoteView {
    var notePreview: some View {
        Section("Preview") {
            NoteCellView(note: Note(id: UUID(), title: viewModel.noteTitle, description: viewModel.noteDescription, symbol: viewModel.symbol, accentColor: viewModel.noteColor, body: "", creationDate: Date.now))
        }
    }
}

///Color Selector View
extension NewNoteView {
    var colorSelector: some View {
        Section("Accent Color") {
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            viewModel.noteColor = color
                        } label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(Color(colorName: color)!)
                        }
                    }
                }
            }
            .shadow(radius: 5, y: 8)
            .padding(.vertical, 10)
        }
        .ignoresSafeArea()
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            .preferredColorScheme(.dark)
    }
}
