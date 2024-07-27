//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rico on 1/5/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        TextButton(title: "Logout", background: Color.red, action: {
            viewModel.logout()
        })
    }
}

#Preview {
    ProfileView()
}
