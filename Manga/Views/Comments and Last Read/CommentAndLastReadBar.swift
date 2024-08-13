//
//  CommentAndLastReadBar.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct CommentAndLastReadBar: View {
    
    @Binding var isCurrentDestinationForCommentAndReadBar: String
    
    var body: some View {
        HStack{
            
            NavigationLink(destination: destinationView(for: .Comment)){
                if isCurrentDestinationForCommentAndReadBar == "Comments" {
                    Text("Comments")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(hex: "#F48611"))
                        .clipShape(.rect(cornerRadius: 40))
                } else {
                    Text("Comments")
                        .padding()
                        .foregroundColor(.black)
                }
            }

            NavigationLink(destination: destinationView(for: .LastRead)){
                if isCurrentDestinationForCommentAndReadBar == "LastRead" {
                    Text("Last Read")
                        .padding()
                        .padding(sides: [.left, .right])
                        .foregroundColor(.white)
                        .background(Color(hex: "#F48611"))
                        .clipShape(.rect(cornerRadius: 40))
                } else {
                    Text("Last Read")
                        .padding()
                        .padding(sides: [.left, .right])
                        .foregroundColor(.black)
                }
            }
        }
        .font(.title2)
        .padding(.vertical , 5)
        .padding(sides: [.left, .right], value: 5)
        .background(Color(hex: "#D9D9D9"))
        .clipShape(.rect(cornerRadius: 60))
    }
}


struct CommentAndLastReadBar_preview: PreviewProvider {
    static var previews: some View {
        @State var isCurrentDestinationForCommentAndReadBar: String = "Comments"
        
        CommentAndLastReadBar(isCurrentDestinationForCommentAndReadBar: $isCurrentDestinationForCommentAndReadBar)
    }
}

//#Preview {
//    
//    @State var isCurrentDestinationForCommentAndReadBar: String = "Comments"
//    
//    CommentAndLastReadBar(isCurrentDestinationForCommentAndReadBar: $isCurrentDestinationForCommentAndReadBar)
//}
