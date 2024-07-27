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
                            viewModel.showingView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $viewModel.showingView, onDismiss: nil, content: {
                        NewItemView(newItemPresented: $viewModel.showingView)
                    })
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                ProfileView()
                    .navigationTitle("Profile")
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
