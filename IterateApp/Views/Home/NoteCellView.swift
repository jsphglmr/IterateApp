//
//  NoteItemView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

struct NoteCellView: View {
    let note: Note
    
    var body: some View {
        
        VStack {
            Image(systemName: note.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(5)
            
            VStack {
                Text(note.title)
                    .font(.subheadline)
                    .bold()
                    .scaledToFit()
                    .foregroundColor(.white)
                
                Text("Last edit: \(note.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        }
        .frame(height: 150)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.secondary))
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCellView(note: Note.testNote)
            .preferredColorScheme(.dark)
    }
}
