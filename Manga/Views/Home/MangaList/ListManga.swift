//
//  ListManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct ListManga: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(), GridItem()], content: {
                ForEach(0..<16, id: \.self) { value in
                    SpecificManga()
                }
            })
        }
    }
}

#Preview {
    ListManga()
}
