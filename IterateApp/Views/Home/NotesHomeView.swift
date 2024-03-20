//
//  NotesHomeView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/5/23.
//

import SwiftUI

struct NotesHomeView: View {
    @ObservedObject var viewModel: NoteViewModel
    @State var showingNewNoteView = false
    @State var goals: [Goal]
    
    init(viewModel: NoteViewModel) {
        self.viewModel = viewModel
        self.goals = viewModel.goals
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(goals, id: \.id) { goal in
                    NavigationLink {
                        NoteDetailView(goal: goal)
                    } label: {
                        NoteCellView(goal: goal)
                    }
                }
                .onDelete(perform: viewModel.deleteNoteIdea)
                .refreshable {
                    viewModel.refreshData()
                }
            }
            .navigationTitle("Iterate")
            .overlay(alignment: .bottomLeading) {
                Button {
                    showingNewNoteView.toggle()
                } label: {
                    Text("New Note")
                    Image(systemName: "plus.circle.fill")
                }
                .foregroundColor(.white)
                .ignoresSafeArea()
                .frame(height: 50)
                .frame(width: 175)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 1, green: 1, blue: 1)))
                .shadow(color: .white.opacity(0.5), radius: 3)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
                .font(.title2)
                .bold()
                
                .sheet(isPresented: $showingNewNoteView) {
                    viewModel.refreshData()
                } content: {
                    NewNoteView()
                }
            }
        }
        .onChange(of: viewModel.goals) { goals in
            self.goals = goals
            print(goals.count)
        }
    }
}

struct NotesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NotesHomeView(viewModel: NoteViewModel())
            .preferredColorScheme(.dark)
    }
}
