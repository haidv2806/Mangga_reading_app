//
//  UserPostLlist.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserPostLlist: View {
    var body: some View {
        UserPost(
            Mangga_Image: UIImage(named: "Luffy") ?? UIImage(),
            Mangga_Name: "One Piece",
            Mangga_Time_Pass: 1,
            Mangga_Description: "One Piece is a popular manga and anime series created by Eiichiro Oda. It follows the adventures of Monkey D. Luffy and his pirate crew, ")
        UserPost(
            Mangga_Image: UIImage(named: "Naruto") ?? UIImage(),
            Mangga_Name: "Naruto",
            Mangga_Time_Pass: 2,
            Mangga_Description: "Naruto, a manga and anime series, evokes a sense of excitement, emotional investment, and inspiration through its compelling story")
    }
}

#Preview {
    UserPostLlist()
}
