//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import SwiftUI

struct RegistrationView: View {
  
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "fanum tax", angle: -15, backgroundColor: .orange)
            Spacer()
            
            Form {
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextButton(title: "Create Account ", background: Color.green) {
                    // log in action
                    viewModel.register()
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
