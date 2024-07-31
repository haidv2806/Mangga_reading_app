//
//  MangaList.swift
//  Manga
//
//  Created by DongNH on 4/21/23.
//

import Foundation

struct MangaList: Codable {
    let latestUptate: String
    let mangaLink: [MangaLink]
}

struct MangaLink: Codable, Identifiable {
    let authorHome: String
    let chapterHome: [ChapterHome]
    var link: String
    let poster: URL
    let title: String
	var id: String { title }
}

struct ChapterHome: Codable {
    let link: String
    let title: String
}
