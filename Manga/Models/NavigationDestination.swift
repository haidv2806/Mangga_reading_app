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
    case SignIn
    case SignUp
    case LastRead
    
    
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
            case .SignIn:
                return "signIn"
            case .SignUp:
                return "signUp"
            case .LastRead:
                return "LastRead"
            }
        }
    
}

@ViewBuilder
func destinationView(for destination: NavigationDestination) -> some View {
    switch destination {
    case .HomeInterface(let selectedCategory):
        HomeInterface(selectedCategory: selectedCategory)
    case .Comment:
        Comments()
    case .Bookmark:
        UserProfile() // placehoder
    case .UserProfile:
        UserProfile()
    case .SignIn:
        SignIn()
    case .SignUp:
        SignUp()
    case .LastRead:
        LastRead()
    }
}
