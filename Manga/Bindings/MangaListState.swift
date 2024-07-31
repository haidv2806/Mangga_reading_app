//
//  MangaListState.swift
//  Manga
//
//  Created by QuyNM on 5/8/23.
//

import SwiftUI

class MangaListState: ObservableObject {
    @Published var mangas: [MangaLink]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let mangaService: MangaService

    init(mangaService: MangaService = MangaStore.shared) {
        self.mangaService = mangaService
    }

    func loadMangas(with path: MangaPath) {
        self.mangas = nil
        self.isLoading = true
        self.mangaService.fetchMangas(from: path) { [weak self] (result) in
            guard let self = self else {
                return
            }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.mangas = response.mangaLink
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
