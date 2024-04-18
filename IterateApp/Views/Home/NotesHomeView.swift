//
//  NotesHomeView.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/5/23.
//

import SwiftUI
import SwiftData

struct NotesHomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State var showingNewNoteView = false
    @Query var goals: [Goal] = []
    
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
                .onDelete(perform: deleteGoalIdea)
                .listRowSeparator(.hidden)
            }
            .listRowSpacing(0)
            .navigationTitle("Iterate")
            .navigationBarTitleDisplayMode(.inline)
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
                    NewNoteView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .tint(.white)
                    }
                }
            }
        }
    }
    
    func deleteGoalIdea(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(goals[index])
        }
    }
}

struct NotesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NotesHomeView()
            .preferredColorScheme(.dark)
    }
}
