//
//  HomeTop.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct HomeTop: View {
    
    @State var SearchText = ""
    
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .padding(sides: [.left, .right])
                })
                
                TextField("Search here", text: $SearchText)
                    .background(Color(hex: "#F4F4F4"))
                
            }
            .padding(10)
            .background(Color(hex: "#F4F4F4"))
            .clipShape(.rect(cornerRadius: 40))
            
            Image(systemName: "bell.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(sides: [.left], value: 20)
                
        }
        .foregroundColor(.black)
        .font(.title2)
    }
        
    }

#Preview {
    HomeTop()
}
