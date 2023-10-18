//
//  LoginView.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "SwiftTodo", subtitle: "Login to Your Account", angle: 15, background: .pink)
                
                // Login Form
                Form{
                    
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address" , text: $loginViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password" , text: $loginViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    LogRegButton(
                        title: "Login",
                        textColor: .white, 
                        action: {
                            loginViewModel.login()
                    })
                }
                .offset(y: -50)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()

            }
        }
    }
}

#Preview {
    LoginView()
}
