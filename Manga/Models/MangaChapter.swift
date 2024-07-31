//
//  MangaChapter.swift
//  Manga
//
//  Created by đông on 31/05/2023.
//

import Foundation

struct MangaChapter: Codable {
	let chapters: [Chapter]
}

struct Chapter: Codable, Identifiable {
	let chapterId: Int
	let chapterName: String
	let pageList1: [String]
	var id: Int { chapterId }
}
