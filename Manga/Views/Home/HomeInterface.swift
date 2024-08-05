//
//  HomeInterface.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct HomeInterface: View {
    @StateObject var viewModel = MangaViewModel()
    @State private var isNavigation_UserProfile_Active = false
    @State private var isNavigation_HomeInterFace_Active = false
    @State private var isNavigation_Comment_Active = false
    @State private var isNavigation_Bookmark_Active = false
    
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
                    Text("AsyncImage is only available on iOS 15 or newer.")
                }
                
                TaskBar(User_Image: "UserImg", isNavigation_UserProfile_Active: $isNavigation_UserProfile_Active,  isNavigation_HomeInterFace_Active: $isNavigation_HomeInterFace_Active,isNavigation_Comment_Active: $isNavigation_Comment_Active, isNavigation_Bookmark_Active: $isNavigation_Bookmark_Active)
                NavigationLink(destination: UserProfile(), isActive: $isNavigation_UserProfile_Active) {
                    EmptyView()
                }
                NavigationLink(destination: HomeInterface(selectedCategory: $selectedCategory), isActive: $isNavigation_HomeInterFace_Active) {
                    EmptyView()
                }
                NavigationLink(destination: UserProfile(), isActive: $isNavigation_Comment_Active) {
                    EmptyView()
                }
                NavigationLink(destination: UserProfile(), isActive: $isNavigation_Bookmark_Active) {
                    EmptyView()
                }
            }
            .padding(sides: [.left, .right], value: 17)
        }
//        .ignoresSafeArea()
    }
}

struct HomeInterface_preview: PreviewProvider {
    static var previews: some View {
        @State var selectedCategory: String = ""
        HomeInterface( selectedCategory: $selectedCategory)
    }
}
