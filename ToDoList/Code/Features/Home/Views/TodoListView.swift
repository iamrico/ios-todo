//
//  TodoListView.swift
//  ToDoList
//
//  Created by Rico on 12/5/2024.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    
    private let userId:String
    
    init(userId: String) {
        self.userId = userId;
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TodoListView(userId: "")
}
