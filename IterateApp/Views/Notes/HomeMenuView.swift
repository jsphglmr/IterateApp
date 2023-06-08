//
//  HomeMenuView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/8/23.
//

import SwiftUI

struct NoteDetailMenuView: View {
    var body: some View {
        Menu("More") {
            Button(role: .destructive) {
                //delete action
            } label: {
                Label("Delete", systemImage: "trash")
            }

        }
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailMenuView()
    }
}
