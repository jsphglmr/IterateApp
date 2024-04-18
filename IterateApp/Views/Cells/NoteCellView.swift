//
//  NoteItemView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/2/23.
//

import SwiftUI

struct NoteCellView: View {
    let goal: Goal
    
    var body: some View {
        
        HStack(alignment: .center) {
            Image(systemName: goal.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .padding(.horizontal, 15)
                .foregroundColor(Color(colorName: goal.accentColor))
            
            VStack(alignment: .leading) {
                Text(goal.title)
                    .font(.title2)
                    .bold()
                    .scaledToFit()
                    .foregroundColor(Color(colorName: goal.accentColor))
                
                Text(goal.info)
                    .padding(.vertical, 3)
                
                Text("Last edit: \(goal.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            Spacer()
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .background(.white.opacity(0.1))
        .background(LinearGradient(colors: [
            Color(colorName: goal.accentColor)!.opacity(0.5),
            Color(colorName: goal.accentColor)!.opacity(0.1)
        ], startPoint: .topLeading, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(colorName: goal.accentColor)!))
        .padding(.vertical, 5)
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCellView(goal: Goal(title: "test", description: "test123", symbol: "pencil", accentColor: "red", notes: [Note(body: "test body")], creationDate: .now))
            .preferredColorScheme(.dark)
    }
}
