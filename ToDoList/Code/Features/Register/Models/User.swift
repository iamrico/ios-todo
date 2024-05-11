//
//  User.swift
//  ToDoList
//
//  Created by Rico on 11/5/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
