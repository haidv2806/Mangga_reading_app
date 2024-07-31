//
//  MangaDetailState.swift
//  Manga
//
//  Created by QuyNM on 5/8/23.
//

import SwiftUI

class MangaDetailState: ObservableObject {
    private let mangaService: MangaService
    @Published var manga: MangaLink?
    @Published var isLoading = false
    @Published var error: NSError?

    init(mangaService: MangaService = MangaStore.shared) {
        self.mangaService = mangaService
    }

    func loadManga(id: String) {
        self.manga = nil
        self.isLoading = false
//        self.mangaService.fetchMangas(from: <#T##MangaPath#>, completion: <#T##(Result<MangaList, MangaError>) -> ()#>)
    }
}
