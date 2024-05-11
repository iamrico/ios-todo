//
//  ContentView.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            TodoListView()
        } else {
            NavigationView {
                LoginView()

            }
        }
    }
}

#Preview {
    MainView()
}
