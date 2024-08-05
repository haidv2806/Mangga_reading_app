//
//  HomeInterface.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct HomeInterface: View {
    @StateObject var viewModel = MangaViewModel()
    @Binding var selectedCategory: String
    
    var body: some View {
        VStack{
            HomeTop()
            if #available(iOS 15.0, *) {
                ListManga(mangas: viewModel.mangaCategories)
                    .task {
                        await viewModel.fetchCategoryMangas(category: selectedCategory)
                    }
            } else {
                // Fallback for earlier versions
                Text("AsyncImage is only available on iOS 15 or newer.")
            }
            
            TaskBar(User_Image: "UserImg")
        }
        .padding(sides: [.left, .right], value: 17)
    }
}

struct HomeInterface_preview: PreviewProvider {
    static var previews: some View {
        @State var selectedCategory: String = ""
        HomeInterface( selectedCategory: $selectedCategory)
    }
}
