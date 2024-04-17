//
//  IterationBodyCellView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 4/14/24.
//

import SwiftUI

struct IterationBodyCellView: View {
    var note: Note
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(note.body)
                    .font(.title3.monospaced())
                HStack(alignment: .bottom, spacing: 0) {
                    Spacer()
                    Text(note.creationDate.formatted(.dateTime.day().month()))
                        .font(.caption.monospaced())
                }
            }
        }
    }
}

#Preview {
    IterationBodyCellView(note: Note(body: "test note body", creationDate: .now))
        .preferredColorScheme(.dark)
}
