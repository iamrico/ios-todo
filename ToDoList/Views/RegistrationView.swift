//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "fanum tax", angle: -15, backgroundColor: .orange)
            Spacer()
            
            Form {
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
            }
        }
    }
}

#Preview {
    RegistrationView()
}
