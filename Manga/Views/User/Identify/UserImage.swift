//
//  UserImage.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserImage: View {
    @State private var linkAvatar = UserDefaults.standard.string(forKey: "linkAvatar")
    
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: linkAvatar ?? "https://backend.phoenix.id.vn/accounts/profile/avatar.jpg")){ image in
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        } else {
            // Fallback for earlier versions
            Text("AsyncImage is only available on iOS 15 or newer.")
        }

    }
}

#Preview {
    UserImage()
}
