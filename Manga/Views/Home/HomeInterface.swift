//
//  HomeInterface.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct HomeInterface: View {
    @StateObject var viewModel = MangaViewModel()
    
    @State private var activeNavigation: NavigationDestination?
    
    @Binding var selectedCategory: String
    
    var body: some View {
        NavigationView {
            VStack{
                HomeTop()
                
                if #available(iOS 15.0, *) {
                    ListManga(mangas: viewModel.mangaCategories)
                        .task {
                            await viewModel.fetchCategoryMangas(category: selectedCategory)
                        }
                } else {
                    // Fallback for earlier versions
                    Text("task is only available on iOS 15 or newer.")
                }
                
                TaskBar(User_Image: "UserImg", navigationDestination: $activeNavigation)
                if let activeNavigation = activeNavigation {
                    destinationView(for: activeNavigation)
                }
                
            }
            .padding(sides: [.left, .right], value: 17)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
//        .ignoresSafeArea()
    }
}

struct HomeInterface_preview: PreviewProvider {
    static var previews: some View {
        @State var selectedCategory: String = ""
        HomeInterface( selectedCategory: $selectedCategory)
    }
}
