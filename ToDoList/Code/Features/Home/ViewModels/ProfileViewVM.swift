//
//  ProfileViewVM.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error)
        }
    }
}
