//
//  UserProfile.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct UserProfile: View {
    
    @State private var isNavigation_UserProfile_Active = false
    @State private var isNavigation_HomeInterFace_Active = false
    @State private var isNavigation_Comment_Active = false
    @State private var isNavigation_Bookmark_Active = false
    
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
                //            .ignoresSafeArea()
                //            .padding([.top], 150)
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
