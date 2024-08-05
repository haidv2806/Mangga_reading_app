//
//  ListManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct ListManga: View {
    @State private var showDetailView: Bool = false
    @State private var selectedManga: MangaCategory?
    
    var mangas: [MangaCategory]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(), GridItem()], content: {
                ForEach(mangas) { manga in
                    SpecificManga(Manga_title: manga.title, Manga_authorHome: manga.authorHome, Manga_poster: manga.poster.absoluteString)
                    
                }
            })
        }
    }
}





struct ListManga_preview: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel = MangaViewModel()
        
        if #available(iOS 15.0, *) {
            ListManga(mangas: viewModel.mangaCategories)
                .task {
                    await viewModel.fetchCategoryMangas(category: "")
                }
        } else {
            // Fallback for earlier versions
            Text("AsyncImage is only available on iOS 15 or newer.")
        }
    }
}
