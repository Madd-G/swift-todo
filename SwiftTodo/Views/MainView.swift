//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentuserId.isEmpty {
         accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentuserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
