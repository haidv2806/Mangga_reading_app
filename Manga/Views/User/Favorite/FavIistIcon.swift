//
//  FavIistIcon.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct FavIistIcon: View {

    
    var body: some View {
        HStack (spacing: 17){
            FavIcon(FavoriteName: .Horror)
            FavIcon(FavoriteName: .Drama)
            FavIcon(FavoriteName: .Romance)
            FavIcon(FavoriteName: .Fantasy)
        }
        .padding(sides: [.left, .right])
    }
}

#Preview {
    FavIistIcon()
}
