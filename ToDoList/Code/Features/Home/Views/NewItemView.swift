//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject private var viewModel: NewItemViewViewModel
    @Binding var newItemPresented: Bool
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    @State private var savedText: String

    
    init(newItemPresented: Binding<Bool>) {
        self._showingAlert = State(initialValue: false)
        self._newItemPresented = newItemPresented
        
        if let savedText = UserDefaults.standard.string(forKey: "savedText") {
            self._savedText = State(initialValue: savedText)
        } else {
            self._savedText = State(initialValue: "")
        }
        self._viewModel = StateObject(wrappedValue: NewItemViewViewModel())

    }
    
    var body: some View {
            VStack {
                closeButton
                Text("New Item").font(.system(size: 32))
                    .textFieldStyle(DefaultTextFieldStyle()).padding(.top, 50)
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
        
            .onAppear {
                    if let savedText = UserDefaults.standard.string(forKey: "savedText") {
                        viewModel.updateTitle(to: savedText)
                    }
                }
    }
        
    
    var closeButton: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        if viewModel.title.isEmpty {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showingAlert = true
                        }
                        
                    }) {
                        Image(systemName: "xmark.circle")
                            .padding(10)
                    }.alert(isPresented: $showingAlert) {
                        
                        Alert(
                            title: Text("Important Message"),
                            message: Text("There is content here, do you want to save and close?"),
                            primaryButton: .default(Text("OK"), action: {
                                UserDefaults.standard.set(viewModel.title, forKey: "savedText")
                                
                                presentationMode.wrappedValue.dismiss()

                            }),
                            secondaryButton: .cancel()
                        )
                    }
                }
                .padding(.top, 5)
            }
        }
}

//#Preview {
//    NewItemView(newItemPresented: Binding(get: {
//        return true
//    }, set: { _ in
//        
//    }))
//}
