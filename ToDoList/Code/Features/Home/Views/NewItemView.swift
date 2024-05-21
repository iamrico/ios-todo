//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
            VStack {
                Text("New Item").font(.system(size: 32))
                    .textFieldStyle(DefaultTextFieldStyle()).padding(.top, 100)
                Form {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    TextButton(title: "Save", background: .pink) {
                        
                        viewModel.save()
                    }
                    .padding()
                }
            }
    }
}

#Preview {
    NewItemView()
}
