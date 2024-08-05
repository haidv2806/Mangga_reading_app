//
//  SpecificManga.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import SwiftUI

struct SpecificManga: View {
    let Manga_title: String
    let Manga_authorHome: String
    let Manga_poster: String
    
    var body: some View {
        ZStack{
            if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: Manga_poster)){ image in
                image.resizable()
//                image.scaledToFit()
            } placeholder: {
                ProgressView()
            }
            } else {
                // Fallback for earlier versions
                Text("AsyncImage is only available on iOS 15 or newer.")
            }

            VStack{
                Spacer()
                VStack {
                    HStack{
                        Text(Manga_title)
                            .font(.title3)
                        Spacer()
                    }
                    
                    HStack{
                        Text(Manga_authorHome)
                            .font(.callout)
                        Spacer()
                    }
                }
                .padding(sides: [.left], value: 5)
                .frame(width: 168, height: 61)
                .background(Color(hex: "#F48611"))
                .opacity(0.85)
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
    SpecificManga(Manga_title: "Sakamoto Days", Manga_authorHome: "Nami Sano", Manga_poster: "https://ww5.manganelo.tv/mangaimage/manga-tv996530.jpg" )
}
