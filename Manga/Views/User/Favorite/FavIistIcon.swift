//
//  FavIistIcon.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct FavIistIcon: View {
    var body: some View {
        HStack (spacing: 10){
            FavIcon(Favorite_Name: "Horor", Favorite_Color: Color(hex: "#664C65"))
            FavIcon(Favorite_Name: "Drama", Favorite_Color: Color(hex: "#A58ED2"))
            FavIcon(Favorite_Name: "Romance", Favorite_Color: Color(hex: "#FF34BA"))
            FavIcon(Favorite_Name: "Fantasy", Favorite_Color: Color(hex: "#F6D166"))
        }
        .padding()
    }
}

#Preview {
    FavIistIcon()
}
