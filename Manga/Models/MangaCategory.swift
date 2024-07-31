//
//  MangaCategory.swift
//  Manga
//
//  Created by QuyNM on 5/30/23.
//

import SwiftUI

struct MangaCategoryList: Codable {
    let latestUptate: String
    let mangaLink: [MangaCategory]
}

struct MangaCategory: Codable, Identifiable {
    let authorHome: String
    var chapterHome: [ChapterHome2]
    let link: String
    let poster: URL
    let title: String
    var id: String { title }
}

struct ChapterHome2: Codable {
	let link: String
	let title: String?
}
