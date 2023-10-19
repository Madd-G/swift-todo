//
//  ProfileView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
