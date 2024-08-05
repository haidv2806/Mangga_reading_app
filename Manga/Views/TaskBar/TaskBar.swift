//
//  TaskBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct TaskBar: View {
    let User_Image: String
    @Binding var isNavigation_UserProfile_Active: Bool
    @Binding var isNavigation_HomeInterFace_Active: Bool
    @Binding var isNavigation_Comment_Active: Bool
    @Binding var isNavigation_Bookmark_Active: Bool
    
    var body: some View {
        
        HStack (spacing: 50){
            Button(action: {
                isNavigation_HomeInterFace_Active = true
            }, label: {
                Image(systemName: "house.fill")
            })
            Button(action: {
                isNavigation_Comment_Active = true
            }, label: {
                Image(systemName: "list.clipboard")
            })
            Button(action: {
                isNavigation_Bookmark_Active = true
            }, label: {
                Image(systemName: "bookmark")
            })
            Button(action: {
                isNavigation_UserProfile_Active = true
            }, label: {
                UserImage(User_Image: UIImage(named: User_Image) ?? UIImage())
                    .frame(width: 60, height: 60)
            })
        }
        .font(.largeTitle)
        .frame(height: 60)
        .foregroundColor(.black)
    }
}

//#Preview {
//    TaskBar(User_Image: "UserImg", isNavigationActive: false)
//}
