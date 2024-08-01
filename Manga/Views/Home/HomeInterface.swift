//
//  HomeInterface.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct HomeInterface: View {
    var body: some View {
        VStack{
            HomeTop()
            ListManga()
            TaskBar(User_Image: "UserImg")
        }
        .padding(sides: [.left, .right], value: 17)
    }
}

#Preview {
    HomeInterface()
}
