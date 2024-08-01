//
//  ReadNowButton.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct ReadNowButton: View {
    var body: some View {
        Button(action: {
            print("Read")
        }) {
            Text("Read Now")
                .font(.system(size: 18))
                .padding(sides: [.left, .right], value: 50)
                .padding()
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
        .background(Color(hex: "#F48611"))
        .cornerRadius(25)
    }
}

#Preview {
    ReadNowButton()
}
