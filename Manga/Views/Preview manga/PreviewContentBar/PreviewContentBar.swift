//
//  PreviewContentBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct PreviewContentBar: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .fill(colorFromRGB(red: 255, green: 240, blue: 226))
                    .frame(width: 60, height: 60)
                Image(systemName: "bookmark")
            }
            
            ReadNowButton()
            
            ZStack {
                Circle()
                    .fill(colorFromRGB(red: 255, green: 240, blue: 226))
                    .frame(width: 60, height: 60)
                Image(systemName: "ellipsis.message")
            }
        }
        .font(.title)
        .foregroundColor(Color(hex: "#F48611"))
    }
}

#Preview {
    PreviewContentBar()
}
