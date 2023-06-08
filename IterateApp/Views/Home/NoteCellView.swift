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
        
        HStack(alignment: .center) {
            Image(systemName: note.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.horizontal, 15)
            
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.title2)
                    .bold()
                    .scaledToFit()
                    .foregroundColor(.white)
                
                Text(note.description)
                    .padding(.vertical, 3)
                
                Text("Last edit: \(note.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            Spacer()
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.secondary))
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCellView(note: Note.testNote)
            .preferredColorScheme(.dark)
    }
}
