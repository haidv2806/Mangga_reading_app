//
//  UserProfile.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct UserProfile: View {
    
    @State private var activeNavigation: NavigationDestination?
    @State private var isCurrentDestination: String = "UserProfile"
    
    @State public var selectedCategory: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Image("UserProfile_Backgound")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                
                VStack{
                    //                Spacer(minLength: 130)
                    Spacer()
                    UserIdentify(User_Image: "UserImg", User_Name: "Olivia Fate")
                    
                    HStack {
                        Text("Favorite")
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        Spacer()
                    }
                    
                    FavIistIcon()
                    
                    HStack {
                        Text("Post")
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        Spacer()
                    }
                    
                    UserPostLlist()
                    
                    TaskBar(User_Image: "UserImg", navigationDestination: $activeNavigation, isCurrentDestination: $isCurrentDestination)
                    if let activeNavigation = activeNavigation {
                        destinationView(for: activeNavigation)
                    }
                }
                .padding(sides: [.left, .right], value: 17)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    UserProfile()
}
