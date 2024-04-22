//
//  NewNoteView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/22/23.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct NewNoteView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var noteTitle = ""
    @State private var noteInfo = ""
    @State private var noteTag = "Education"
    @State private var symbol = "pencil"
    @State private var noteColor = "red"
    @State private var iconPickerPresented = false
    
    var allFieldsComplete: Bool {
        noteTitle.isEmpty || noteInfo.isEmpty || noteColor.isEmpty
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
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        modelContext.insert(
                            Goal(
                                title: noteTitle,
                                description: noteInfo,
                                symbol: symbol,
                                accentColor: noteColor,
                                notes: [],
                                creationDate: Date.now
                            )
                        )
                        dismiss()
                    } label: {
                        if allFieldsComplete {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.placeholder)
                        } else {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(Color(colorName: noteColor) ?? .red)
                        }
                    }
                    .disabled(allFieldsComplete)
                }
            }
        }
    }
}

///Title View
extension NewNoteView {
    var titleInput: some View {
        Section("Note Title") {
            TextField("Title...", text: $noteTitle)
                .multilineTextAlignment(.leading)
        }
    }
}

///Goal Selector View
extension NewNoteView {
    var goalInput: some View {
        Section("Description") {
            TextField("A new way to...", text: $noteInfo)
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
                    Image(systemName: symbol)
                    Text(symbol)
                }
            }
            .sheet(isPresented: $iconPickerPresented) {
                SymbolPicker(symbol: $symbol)
            }
        }
    }
}

///Color Selector View
extension NewNoteView {
    var colorSelector: some View {
        Section("Accent Color") {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            noteColor = color
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

///Note Preview
extension NewNoteView {
    var notePreview: some View {
        Section("Preview") {
            NoteCellView(goal: Goal(id: UUID(), title: noteTitle, description: noteInfo, symbol: symbol, accentColor: noteColor, notes: [], creationDate: Date.now))
        }
    }
}
