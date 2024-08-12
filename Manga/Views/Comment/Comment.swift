//
//  Comment.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 8/8/24.
//

import SwiftUI

struct Comment: View {
    let User_Image: UIImage
    let User_name: String
    let User_comment: String
    let User_Time_from_Last_comment: String
    
    var body: some View {
        HStack {
            Image(uiImage: User_Image)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 64, height: 64)
                .padding(sides: [.right], value: 10)
            
            
            VStack (alignment: .leading) {
                Text(User_name)
                    .font(.title3)
                    .bold()
                
                
                Text(User_comment)
                    .font(.title3)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(User_Time_from_Last_comment)
                .font(.title3)
                .bold()
                .padding(sides: [.left, .right], value: 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    Comment(User_Image: UIImage(named: "Luffy") ?? UIImage(), User_name: "Kyrie Gray", User_comment: "This is a SUPER GREAT MANGA", User_Time_from_Last_comment: "1m")
}
