//
//  UserPost.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserPost: View {
    let Mangga_Image: UIImage
    let Mangga_Name: String
    let Mangga_Time_Pass: Int
    let Mangga_Description: String
    var body: some View {
        ZStack{
            HStack{
                Image(uiImage: Mangga_Image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                VStack{
                    HStack{
                        Text(Mangga_Name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.bold(.title2)())
                        Text("\(Mangga_Time_Pass)m")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.bold(.title2)())
                    }
                    Text(Mangga_Description)
                }
                
                .padding(sides: [.left], value: 20)
                .padding(sides: [.right], value: 10)
            }
            .background(Color(hex: "#FCDBB8"))
            .clipShape(.rect(cornerRadius: 20))
        }
//        .padding(sides: [.left])
//        .padding(sides: [.right])
    }
}

#Preview {
    UserPost(
        Mangga_Image: UIImage(named: "Luffy") ?? UIImage(),
        Mangga_Name: "One Piece",
        Mangga_Time_Pass: 1,
        Mangga_Description: "One Piece is a popular manga and anime series created by Eiichiro Oda. It follows the adventures of Monkey D. Luffy and his pirate crew, ")
//    UserPost()
}
