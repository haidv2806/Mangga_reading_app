//
//  StubManga.swift
//  Manga
//
//  Created by đông on 22/04/2023.
//

import Foundation

extension MangaLink {

	static var stubbedMangas: [MangaLink] {
		let response: MangaList? = try? Bundle.main.loadAndDecodeJSON(filename: "manga_list")
		return response?.mangaLink ?? [MangaLink]()
	}

	static var stubbedManga: MangaLink {
		stubbedMangas[0]
	}
}

extension Bundle {

	func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
		guard let url = self.url(forResource: filename, withExtension: "json") else {
			return nil
		}
		let data = try Data(contentsOf: url)
		let jsonDecoder = Utils.jsonDecoder
		let decodedModel = try jsonDecoder.decode(D.self, from: data)
		return decodedModel
	}
}
