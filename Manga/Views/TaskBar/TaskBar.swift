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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "house.fill")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "list.clipboard")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bookmark")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("UserImg")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
            })



        }
        .font(.largeTitle)
        .frame(height: 100)
    }
}

#Preview {
    TaskBar()
}
