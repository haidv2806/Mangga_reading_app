//
//  GroupCommentForAMangga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct GroupCommentForAMangga: View {
    var body: some View {
        VStack{            
            ForEach(0..<4) {_ in
                Comment(User_Image: UIImage(named: "Luffy") ?? UIImage(), User_name: "Kyrie Gray", User_comment: "This is a SUPER GREAT MANGA", User_Time_from_Last_comment: "1m")
            }
            
            ChatPanel()
        }
        .padding(sides: [.left, .right], value: 20)
    }
}

#Preview {
    GroupCommentForAMangga()
}
