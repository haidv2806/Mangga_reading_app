//
//  ListManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct ListManga: View {
//    @State private var showDetailView: Bool = false
//    @State private var selectedManga: MangaCategory?
    @Binding var showDetailView: Bool
    @Binding var selectedManga: MangaCategory?
    @State private var animateCurrentManga: Bool = false
    @Namespace private var animation
    
    var mangas: [MangaCategory]
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(), GridItem()], content: {
                    ForEach(mangas) { manga in
                        SpecificManga(Manga_title: manga.title, Manga_authorHome: manga.authorHome, Manga_poster: manga.poster.absoluteString)
                            .onTapGesture {
                                withAnimation {
                                    selectedManga = manga
                                    showDetailView = true
                                }
                            }
                    }
                })
            }
//            .overlay {
//                if let selectedManga, showDetailView {
//                    DetailView(show: $showDetailView, animation: animation, manga: selectedManga, link: selectedManga.link)
//                        .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
//                }
//            }
            .onChange(of: showDetailView) { newValue in
                if !newValue {
                    withAnimation(.easeInOut(duration: 0.15).delay(0.3)) {
                        animateCurrentManga = false
                    }
                }
            }
        } else {
            
        }
    }
}






struct ListManga_preview: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel = MangaViewModel()
        @State var showDetailView = false
        @State var selectedManga: MangaCategory? = nil
        
        if #available(iOS 15.0, *) {
            ListManga(showDetailView: $showDetailView, selectedManga: $selectedManga, mangas: viewModel.mangaCategories)
                .task {
                    await viewModel.fetchCategoryMangas(category: "")
                }
        } else {
            Text("task is only available on iOS 15 or newer.")
        }
    }
}
