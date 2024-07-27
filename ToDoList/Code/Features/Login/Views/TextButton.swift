//
//  TDButton.swift
//  ToDoList
//
//  Created by Rico on 5/5/2024.
//

import SwiftUI

struct TextButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(background)
                
                Text(title).bold().foregroundColor(Color.white)
            }
        }
        .frame(height: 50)
        .padding()
    }
}

#Preview {
    TextButton(title: "lol", background: Color.blue) {}
}
