//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
