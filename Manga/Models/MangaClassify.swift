//
//  MangaClassify.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 1/8/24.
//

import Foundation
import SwiftUI

enum MangaClassify: String, CaseIterable {
    
    var id: MangaClassify { self }
    
    case Comedy = "Comedy"
    case Drama = "Drama"
    case Horror = "Horror"
    case Manhua = "Manhua"
    case Mature = "Mature"
    case Mystery = "Mystery"
    case Psychological = "Psychological"
    case Sci_fi = "Sci fi"
    case Shoujo_ai = "Shoujo ai"
    case Slice_of_life = "Slice of life"
    case Supernatural = "Supernatural"
    case Yaoi = "Yaoi"
    case Action = "Action"
    case Cooking = "Cooking"
    case Erotica = "Erotica"
    case Isekai = "Isekai"
    case Manhwa = "Manhwa"
    case Mecha = "Mecha"
    case Romance = "Romance"
    case Seinen = "Seinen"
    case Shounen = "Shounen"
    case Tragedy = "Tragedy"
    case Yuri = "Yuri"
    case Adventure = "Adventure"
    case Doujinshi = "Doujinshi"
    case Fantasy = "Fantasy"
    case Historical = "Historical"
    case Josei = "Josei"
    case Martial_arts = "Martial arts"
    case Medical = "Medical"
    case School_life = "School life"
    case Shoujo = "Shoujo"
    case Shounen_ai = "Shounen ai"
    case Sports = "Sports"
    case Webtoons = "Webtoons"
    case Parody = "Parody"

    var Manga_Classify_Hex_Color_Start: Color {
        switch self {
        case .Comedy:
            Color(hex: "#603813")
        case .Drama:
            Color(hex: "#A58ED2")
        case .Horror:
            Color(hex: "#664C65")
        case .Manhua:
            Color(hex: "#603813")
        case .Mature:
            Color(hex: "#603813")
        case .Mystery:
            Color(hex: "#603813")
        case .Psychological:
            Color(hex: "#603813")
        case .Sci_fi:
            Color(hex: "#603813")
        case .Shoujo_ai:
            Color(hex: "#603813")
        case .Slice_of_life:
            Color(hex: "#603813")
        case .Supernatural:
            Color(hex: "#603813")
        case .Yaoi:
            Color(hex: "#603813")
        case .Action:
            Color(hex: "#FF3131")
        case .Cooking:
            Color(hex: "#603813")
        case .Erotica:
            Color(hex: "#603813")
        case .Isekai:
            Color(hex: "#603813")
        case .Manhwa:
            Color(hex: "#603813")
        case .Mecha:
            Color(hex: "#603813")
        case .Romance:
            Color(hex: "#FF34BA")
        case .Seinen:
            Color(hex: "#603813")
        case .Shounen:
            Color(hex: "#603813")
        case .Tragedy:
            Color(hex: "#603813")
        case .Yuri:
            Color(hex: "#603813")
        case .Adventure:
            Color(hex: "#603813")
        case .Doujinshi:
            Color(hex: "#603813")
        case .Fantasy:
            Color(hex: "#F6D166")
        case .Historical:
            Color(hex: "#603813")
        case .Josei:
            Color(hex: "#603813")
        case .Martial_arts:
            Color(hex: "#603813")
        case .Medical:
            Color(hex: "#603813")
        case .School_life:
            Color(hex: "#603813")
        case .Shoujo:
            Color(hex: "#603813")
        case .Shounen_ai:
            Color(hex: "#603813")
        case .Sports:
            Color(hex: "#603813")
        case .Webtoons:
            Color(hex: "#603813")
        case .Parody:
            Color(hex: "#84FAB0")
        }
    }
    
    var Manga_Classify_Hex_Color_End: Color{
        switch self {
        case .Comedy:
            Color(hex: "#b29f94")
        case .Drama:
            Color(hex: "#F6BFEA")
        case .Horror:
            Color(hex: "#A9A3A3")
        case .Manhua:
            Color(hex: "#b29f94")
        case .Mature:
            Color(hex: "#b29f94")
        case .Mystery:
            Color(hex: "#b29f94")
        case .Psychological:
            Color(hex: "#b29f94")
        case .Sci_fi:
            Color(hex: "#b29f94")
        case .Shoujo_ai:
            Color(hex: "#b29f94")
        case .Slice_of_life:
            Color(hex: "#b29f94")
        case .Supernatural:
            Color(hex: "#b29f94")
        case .Yaoi:
            Color(hex: "#b29f94")
        case .Action:
            Color(hex: "#EB8888")
        case .Cooking:
            Color(hex: "#b29f94")
        case .Erotica:
            Color(hex: "#b29f94")
        case .Isekai:
            Color(hex: "#b29f94")
        case .Manhwa:
            Color(hex: "#b29f94")
        case .Mecha:
            Color(hex: "#b29f94")
        case .Romance:
            Color(hex: "#FF8DD8")
        case .Seinen:
            Color(hex: "#b29f94")
        case .Shounen:
            Color(hex: "#b29f94")
        case .Tragedy:
            Color(hex: "#b29f94")
        case .Yuri:
            Color(hex: "#b29f94")
        case .Adventure:
            Color(hex: "#b29f94")
        case .Doujinshi:
            Color(hex: "#b29f94")
        case .Fantasy:
            Color(hex: "#FDA483")
        case .Historical:
            Color(hex: "#b29f94")
        case .Josei:
            Color(hex: "#b29f94")
        case .Martial_arts:
            Color(hex: "#b29f94")
        case .Medical:
            Color(hex: "#b29f94")
        case .School_life:
            Color(hex: "#b29f94")
        case .Shoujo:
            Color(hex: "#b29f94")
        case .Shounen_ai:
            Color(hex: "#b29f94")
        case .Sports:
            Color(hex: "#b29f94")
        case .Webtoons:
            Color(hex: "#b29f94")
        case .Parody:
            Color(hex: "#8FD3F4")
        }
    }
}
