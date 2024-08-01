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
            .padding(5)
            .background(Color.orange)
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            

    }
}

#Preview {
    UserImage(User_Image: UIImage(named: "Luffy") ?? UIImage())
}
