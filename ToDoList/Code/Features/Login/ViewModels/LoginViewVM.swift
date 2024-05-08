//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init (){
        
    }
    
    func login() {
        guard isValid() else {
            return
        }
        
        //
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func isValid() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
