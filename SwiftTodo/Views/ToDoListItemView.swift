//
//  ToDoListItemView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var profileViewModel = ProfileViewViewModel()
    let item : ToDoListItem
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                profileViewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "id", title: "title", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
