//
//  LoginView.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "TODO LIST", subtitle: "SKIBIDI", angle: 12, backgroundColor: .pink)
                // Login Form
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextButton(title: "Log In", background: Color.blue) {
                        // log in action
                        viewModel.login()
                    }

                }
                .offset(y: -50)
                .listStyle(PlainListStyle())
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegistrationView())
                }
//                .padding(.bottom, 50)
                
                Spacer()
            }
        }

    }
}

#Preview {
    LoginView()
}
