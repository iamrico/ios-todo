//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
            VStack {
                Text("New Item").font(.system(size: 32))
                    .textFieldStyle(DefaultTextFieldStyle()).padding(.top, 100)
                Form {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    TextButton(title: "Save", background: .pink) {
                        
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                    .padding()
                }.alert(isPresented: $viewModel.showAlert, content: {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer"))
                })
            }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
