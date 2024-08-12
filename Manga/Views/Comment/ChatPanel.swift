//
//  ChatPanel.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 8/8/24.
//

import SwiftUI

struct ChatPanel: View {
    
    @State var SearchText = ""
    
    var body: some View {
        HStack {
            HStack {
                TextField("Leave a comment...", text: $SearchText)
                    .background(Color(hex: "#FFF0E0"))
                    .keyboardType(.default)
                
                Image(systemName: "paperplane")
                    .font(.title)
                    .opacity(0.3)
                    .padding(sides: [.left], value: 20)
                
            }
            .padding(10)
            .background(Color(hex: "#FFF0E0"))
            .clipShape(.rect(cornerRadius: 40))
        }
        .foregroundColor(.black)
        .font(.title2)
    }
}

#Preview {
    ChatPanel()
}
