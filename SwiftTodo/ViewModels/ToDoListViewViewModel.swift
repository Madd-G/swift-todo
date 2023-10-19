//
//  ToDoListViewViewModel.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import Foundation

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {}
    
    func delete (id: String) {
        
    }
}
