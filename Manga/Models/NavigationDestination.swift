//
//  NavigationDestination.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 5/8/24.
//

import SwiftUI

enum NavigationDestination: Identifiable{
    case HomeInterface(selectedCategory: Binding<String>)
    case Comment
    case Bookmark
    case UserProfile
    
    var id: String {
            switch self {
            case .HomeInterface(let selectedCategory):
                // Sử dụng địa chỉ bộ nhớ của Binding làm id
                return "homeInterface-\(selectedCategory.wrappedValue)"
            case .Comment:
                return "comment"
            case .Bookmark:
                return "bookmark"
            case .UserProfile:
                return "userProfile"
            }
        }
    
}

@ViewBuilder
func destinationView(for destination: NavigationDestination) -> some View {
    switch destination {
    case .HomeInterface(let selectedCategory):
        HomeInterface(selectedCategory: selectedCategory)
    case .Comment:
        UserProfile() // placehoder
    case .Bookmark:
        UserProfile() // placehoder
    case .UserProfile:
        UserProfile()
    }
}
