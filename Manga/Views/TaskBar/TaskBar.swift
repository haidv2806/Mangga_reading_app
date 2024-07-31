//
//  TaskBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct TaskBar: View {
    var body: some View {
        HStack (spacing: 50){
            Image(systemName: "house.fill")
            Image(systemName: "list.clipboard")
            Image(systemName: "bookmark")
            Image("UserImg")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
        }
        .font(.largeTitle)
        .frame(height: 100)
    }
}

#Preview {
    TaskBar()
}
