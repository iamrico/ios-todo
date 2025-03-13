//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Rico on 4/5/2024.
//

import Foundation


struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    
    var isDone: Bool
    var rizz: String = "Rizz"
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
