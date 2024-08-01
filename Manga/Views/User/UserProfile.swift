//
//  UserProfile.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
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
                
                TaskBar(User_Image: "UserImg")
            }
//            .ignoresSafeArea()
//            .padding([.top], 150)
            .padding(sides: [.left, .right], value: 17)
        }
    }
}

#Preview {
    UserProfile()
}
