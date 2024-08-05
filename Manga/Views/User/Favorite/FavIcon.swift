//
//  FavIcon.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI


struct FavIcon: View {
    @State var Favorite_Name: MangaClassify
    @State var Favorite_Color_Start: Color
    @State var Favorite_Color_End: Color

    init(FavoriteName: MangaClassify = .Horror) {
        self._Favorite_Name = State(initialValue: FavoriteName)
        self._Favorite_Color_Start = State(initialValue: FavoriteName.Manga_Classify_Hex_Color_Start)
        self._Favorite_Color_End = State(initialValue: FavoriteName.Manga_Classify_Hex_Color_End)
    }
    var body: some View {
        if #available(iOS 15.0, *) {
//            GeometryReader { geometry in
            Text(Favorite_Name.rawValue)
                    .padding(9)
//                    .background(Favorite_Color_Start)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Favorite_Color_Start, Favorite_Color_End]), startPoint: .top, endPoint: .bottom)
                    )
                    .font(.system(size: 16))
                    .clipShape(.rect(cornerRadius: 40))
                    .frame(height: 32)
//                    .clipShape(.rect(cornerRadius: geometry.size.width / 2))
//            }
        }
    }
}

#Preview {
    FavIcon(FavoriteName: .Erotica)
}
