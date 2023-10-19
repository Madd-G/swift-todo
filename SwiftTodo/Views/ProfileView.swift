//
//  ProfileView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let user =  profileViewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            profileViewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding(.bottom, 20)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name ")
                    .bold()
                
                Text(user.name)
            }
            HStack {
                Text("Email ")
                    .bold()
                
                Text(user.email)
            }
            HStack {
                Text("Member since ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
            
        }
        .padding(.bottom, 20)
        
        Button("Log Out") {
            profileViewModel.logOut()
        }
        .tint(.red)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
