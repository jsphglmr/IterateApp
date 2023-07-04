//
//  NoteItemView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

struct NoteCellView: View {
    let note: NoteIdea
    
    var body: some View {
        
        HStack(alignment: .center) {
            Image(systemName: note.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .padding(.horizontal, 15)
                .foregroundColor(Color(colorName: note.accentColor))
            
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.title2)
                    .bold()
                    .scaledToFit()
                    .foregroundColor(Color(colorName: note.accentColor))
                
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
        .background(.white.opacity(0.1))
        .background(LinearGradient(colors: [
            Color(colorName: note.accentColor)!.opacity(0.5),
            Color(colorName: note.accentColor)!.opacity(0.1)
        ], startPoint: .topLeading, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(colorName: note.accentColor)!))
        .padding(.vertical, 10)
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCellView(note: NoteIdea.testNote)
            .preferredColorScheme(.dark)
    }
}
