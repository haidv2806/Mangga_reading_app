//
//  UserIdentify.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserIdentify: View {
    let User_Image: String
    let User_Name: String
    var body: some View {
        HStack (spacing: 20){
            UserImage(User_Image: UIImage(named: User_Image) ?? UIImage())
            
            Text(User_Name)
                .font(.largeTitle)
                .bold()
                .padding([.top], 30)
        }
//        .padding()
    }
}

#Preview {
    UserIdentify(User_Image: "UserImg", User_Name: "Olivia Fate")
}
