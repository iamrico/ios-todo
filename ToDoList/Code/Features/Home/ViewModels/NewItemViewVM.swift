//
//  NewItemViewVM.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    init() {}
    
    func save() {}
}
