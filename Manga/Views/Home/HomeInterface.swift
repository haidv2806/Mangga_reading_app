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
    @State private var isCurrentDestination: String = "HomeInterface"
        
    @Binding var selectedCategory: String
    
    
    @State private var showDetailView: Bool = false
    @State private var selectedManga: MangaCategory? = nil
    @Namespace private var animation
    
    var body: some View {
        if #available(iOS 15.0, *) {
        NavigationView {
            VStack{
                HomeTop()
                

                    ListManga(showDetailView: $showDetailView, selectedManga: $selectedManga, mangas: viewModel.mangaCategories)
                        .task {
                            await viewModel.fetchCategoryMangas(category: selectedCategory)
                        }

                
                TaskBar(User_Image: "UserImg", navigationDestination: $activeNavigation, isCurrentDestination: $isCurrentDestination)
                if let activeNavigation = activeNavigation {
                    destinationView(for: activeNavigation)
                }
                
            }
            .padding(sides: [.left, .right], value: 17)
            
            .overlay {
                if let selectedManga, showDetailView {
                    DetailView(show: $showDetailView, animation: animation, manga: selectedManga, link: selectedManga.link)
                        .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
                } else {
                    EmptyView() // Return an EmptyView if the condition is not met
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
            

            
//        .ignoresSafeArea()
        } else {
            // Fallback for earlier versions
            Text("task is only available on iOS 15 or newer.")
        }
    }
}

struct HomeInterface_preview: PreviewProvider {
    static var previews: some View {
        @State var selectedCategory: String = ""
        HomeInterface( selectedCategory: $selectedCategory)
    }
}
