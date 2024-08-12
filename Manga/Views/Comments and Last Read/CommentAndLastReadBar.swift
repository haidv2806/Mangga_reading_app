//
//  CommentAndLastReadBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct CommentAndLastReadBar: View {
    let Comments = true
    let Last_read = false
    
    var body: some View {
        HStack{
            if Comments {
                Text("Comments")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(hex: "#F48611"))
                    .clipShape(.rect(cornerRadius: 40))
            } else {
                Text("Comments")
                    .padding()
            }
            
            
            if Last_read {
                Text("Last Read")
                    .padding()
                    .padding(sides: [.left, .right])
                    .foregroundColor(.white)
                    .background(Color(hex: "#F48611"))
                    .clipShape(.rect(cornerRadius: 40))
            } else {
                Text("Last Read")
                    .padding()
                    .padding(sides: [.left, .right])
            }

        }
        .font(.title2)
        .padding([.top, .bottom], 5)
        .padding(sides: [.left, .right], value: 5)
        .background(Color(hex: "#D9D9D9"))
        .clipShape(.rect(cornerRadius: 60))
    }
}

#Preview {
    CommentAndLastReadBar()
}
