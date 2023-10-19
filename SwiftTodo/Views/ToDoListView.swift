//
//  ToDoListView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var toDoListViewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                toDoListViewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .background(.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    toDoListViewModel.showingNewItemView = true
                }
                label : {
                    Image(systemName: "plus")

                }
            }
            .sheet(isPresented: $toDoListViewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $toDoListViewModel.showingNewItemView)
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "K5z8uJvFSlfSx6plcrP5FcM8Fq32")
}
