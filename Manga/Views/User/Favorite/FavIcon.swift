//
//  FavIcon.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI


struct FavIcon: View {
    let Favorite_Name: String
    let Favorite_Color: Color
    var body: some View {
        if #available(iOS 15.0, *) {
//            GeometryReader { geometry in
                Text(Favorite_Name)
                    .padding(9)
                    .background(Favorite_Color)
                    .font(.system(size: 20))
                    .clipShape(.rect(cornerRadius: 40))
//                    .clipShape(.rect(cornerRadius: geometry.size.width / 2))
//            }
        }
    }
}

#Preview {
    FavIcon(Favorite_Name: "Horor", Favorite_Color: Color(hex: "#F6D166"))
}
