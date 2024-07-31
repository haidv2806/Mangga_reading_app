//
//  MangaDetail.swift
//  Manga
//
//  Created by QuyNM on 5/8/23.
//

import Foundation

struct MangaDetail: Codable {
    let Description: String
    let Rating: String
    let View: String
    let author: String
    let categories: [String]
    let descriptions: String
    let inforBookmark: URL
    let lastUpdate: String
    let posterManga: URL
    let status: String
    let titleManga: String
    
    var ratingText: String {
        let rateNumber = Rating.extractRating() ?? ""
        let rating = Int(rateNumber) ?? 0
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/5"
    }
}

extension MangaDetail {
    init() {
    Description = ""
    Rating = ""
    View = ""
    author = ""
    categories = []
    descriptions = ""
    inforBookmark = URL(string: "https://google.com")!
    lastUpdate = ""
    posterManga = URL(string: "https://google.com")!
    status = ""
    titleManga = ""
    }
}
