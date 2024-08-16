//
//  UserIdentify.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct UserIdentify: View {
    @State private var userName = UserDefaults.standard.string(forKey: "userName")
    
    var body: some View {
        HStack (spacing: 20){
            UserImage()
                .frame(width: 150, height: 150)
            
            Text(userName ?? "User Name")
                .font(.largeTitle)
                .bold()
                .padding([.top], 50)
        }
//        .padding()
    }
}

#Preview {
    UserIdentify()
}
