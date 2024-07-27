//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import Foundation
import FirebaseAuth

enum KeyChainError: Error {
    case duplicateEntry
    case unknown(OSStatus)
}

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
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        do {
            
            try savePasswordToKeychain(service: "rico-todo-list", account: "jerichomesina02@gmail.com", password: password.data(using: .utf8) ?? Data())
            
        }catch {}
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
    
    private func savePasswordToKeychain(
        service: String,
        account: String,
        password: Data
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.duplicateEntry
        }
        
        guard status == errSecSuccess else {
            throw KeyChainError.unknown(status)
        }
    }
    
    func getData(
        service: String,
        account: String
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
    
        print("Read status: \(status)")
        return result as? Data;
    }
}
