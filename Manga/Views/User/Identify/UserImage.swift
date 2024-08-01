//
//  UserImage.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserImage: View {
    let User_Image: UIImage
    var body: some View {
        Image(uiImage: User_Image)
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            

    }
}

#Preview {
    UserImage(User_Image: UIImage(named: "Luffy") ?? UIImage())
}
