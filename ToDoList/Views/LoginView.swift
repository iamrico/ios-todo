//
//  LoginView.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "TODO LIST", subtitle: "SKIBIDI", angle: 12, backgroundColor: .pink)
                // Login Form
                
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        // attempt login
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(Color.blue)
                            
                            Text("Log In").bold().foregroundColor(Color.white)
                        }
                    }
                    .padding()

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
