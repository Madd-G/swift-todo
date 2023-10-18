//
//  LogRegButton.swift
//  SwiftTodo
//
//  Created by Akhmad Nur Alamsyah on 18/10/23.
//

import SwiftUI

struct LogRegButton: View {
    
    let title : String
    let textColor : Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(textColor)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    LogRegButton(title: "Title",textColor: .white) {
        // Action
    }
}
