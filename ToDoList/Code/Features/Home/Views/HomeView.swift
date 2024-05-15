//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MainViewViewModel()

    
    var body: some View {
        accountView
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            NavigationView {
                TodoListView(userId: viewModel.currentUserId)
                    .navigationTitle("todo list")
                    .toolbar{
                        Button {
                            // action
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                ProfileView()
                    .navigationTitle("bitch")
            }
            .tabItem {
                    Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    HomeView()
}
