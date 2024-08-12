//
//  LastRead.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct LastRead: View {
    
    @State private var activeNavigation: NavigationDestination?
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    CommentAndLastReadBar()
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: [GridItem()], content: {
                            ForEach(0..<6) { _ in
                                Comment(User_Image: UIImage(named: "Luffy") ?? UIImage(), User_name: "Kyrie Gray", User_comment: "This is a SUPER GREAT MANGA", User_Time_from_Last_comment: "1m")
                                    .padding()
                            }
                        })
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(hex: "#F48611"), lineWidth: 1)
                    )
                }
                .padding()
                
                TaskBar(User_Image: "UserImg", navigationDestination: $activeNavigation)
                if let activeNavigation = activeNavigation {
                    destinationView(for: activeNavigation)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    LastRead()
}
