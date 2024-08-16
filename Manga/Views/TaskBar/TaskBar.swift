//
//  TaskBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 31/7/24.
//

import SwiftUI

struct TaskBar: View {
    let User_Image: String
    @Binding var navigationDestination: NavigationDestination?
    @Binding var isCurrentDestination: String
    
    var body: some View {
        
        HStack (spacing: 50){
            NavigationLink(destination: destinationView(for: .HomeInterface(selectedCategory: .constant("")))) {
                Image(systemName: "house.fill")
                    .foregroundColor(isCurrentDestination == "HomeInterface" ? .orange : .black)
            }
            NavigationLink(destination: destinationView(for: .Comment)) {
                Image(systemName: "list.clipboard")
                    .foregroundColor(isCurrentDestination == "Comment" ? .orange : .black)
            }
            NavigationLink(destination: destinationView(for: .Bookmark)) {
                Image(systemName: "bookmark")
                    .foregroundColor(isCurrentDestination == "Bookmark" ? .orange : .black)
            }
            NavigationLink(destination: destinationView(for: .UserProfile)) {
                UserImage(User_Image: UIImage(named: User_Image) ?? UIImage())
                    .frame(width: 60, height: 60)
                    .padding(5)
                    .foregroundColor(isCurrentDestination == "Bookmark" ? .orange : .black)
            }
        }
        .font(.largeTitle)
        .frame(height: 60)
//        .foregroundColor(.black)
    }
}

//#Preview {
//    TaskBar(User_Image: "UserImg", navigationDestination: )
//}
