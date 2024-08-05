//
//  ListManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI


func ListManga (mangas: [MangaCategory]) -> some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(), GridItem()], content: {
                ForEach(mangas) { manga in
                    SpecificManga(Manga_title: manga.title, Manga_authorHome: manga.authorHome, Manga_poster: manga.poster.absoluteString)
                }
            })
        }
}

struct ListManga_preview: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel = MangaViewModel()
        
        ListManga(mangas: viewModel.mangaCategories)
    }
}
