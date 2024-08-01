//
//  SpecificManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct SpecificManga: View {
    var body: some View {
        ZStack{
            Image("Luffy")
                .resizable()
                .scaledToFit()
            
            VStack{
                Spacer()
                VStack {
                    HStack{
                        Text("Sakamoto Days")
                            .font(.title3)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Nami Sano")
                            .font(.callout)
                        Spacer()
                    }
                }
                .padding(sides: [.left], value: 5)
                .frame(width: 168, height: 61)
                .background(Color(hex: "#F48611"))
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 20))
            }
                
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "heart")
                        .font(.title3)
                        .padding(8)
                        .foregroundColor(.black)
                }
            }

        }
        .frame(width: 168, height: 245)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    SpecificManga()
}
