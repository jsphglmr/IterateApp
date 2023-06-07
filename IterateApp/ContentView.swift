//
//  ContentView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NotesHomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
