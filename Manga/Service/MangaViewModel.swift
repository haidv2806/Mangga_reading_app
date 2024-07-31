//
//  MangaViewModel.swift
//  Manga
//
//  Created by QuyNM on 5/11/23.
//

import Foundation

@MainActor
final class MangaViewModel: ObservableObject {
    private let client = Client()
    @Published private(set) var mangaLinks: [MangaLink] = []
	@Published private(set) var mangaChapters: [Chapter] = []
	@Published private(set) var mangaCategories: [MangaCategory] = []
    @Published private(set) var mangaDetail: MangaDetail = .init()
    @Published private(set) var errorMessage: String = ""
    @Published var hasError: Bool = false
    
    var request: URLRequest = {
        let baseURL = "https://manga.gachmen.org"
        let urlString = "\(baseURL)/homenelo"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    var detailRequest: URLRequest = {
        let baseURL = "https://manga.gachmen.org"
        let urlString = "\(baseURL)/detailmanga"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()

	var chapterRequest: URLRequest = {
		let baseURL = "https://manga.gachmen.org"
		let urlString = "\(baseURL)/chapter"
		let url = URL(string: urlString)!
		return URLRequest(url: url)
	}()

	var categoryRequest: URLRequest = {
		let baseURL = "https://manga.gachmen.org"
		let urlString = "\(baseURL)/categorieslist"
		let url = URL(string: urlString)!
		return URLRequest(url: url)
	}()

    func fetchMangas() async {
        do {
            request.httpMethod = "GET"
            request.setValue("https://ww5.manganelo.tv/home", forHTTPHeaderField: "Link-Full")
            let response = try await client.fetch(type: MangaList.self, with: request)
            mangaLinks = response.mangaLink.compactMap { $0 }
        } catch {
            errorMessage = "\((error as! ErrorResponse).customDescription)"
            hasError = true
            print(errorMessage)
        }
    }
    
    func fetchDetailManga(link: String) async {
        do {
            detailRequest.httpMethod = "GET"
            detailRequest.setValue(link, forHTTPHeaderField: "Link-Full")
            let response = try await client.fetch(type: MangaDetail.self, with: detailRequest)
            mangaDetail = response
        } catch {
            errorMessage = "\((error as! ErrorResponse).customDescription)"
            hasError = true
            print(errorMessage)
        }
    }

	func fetchChapterManga(link: String) async {
		do {
			chapterRequest.httpMethod = "GET"
			chapterRequest.setValue(link, forHTTPHeaderField: "Link-Full")
			let response = try await client.fetch(type: MangaChapter.self, with: chapterRequest)
			mangaChapters = response.chapters.compactMap { $0 }
		} catch {
			errorMessage = "\((error as! ErrorResponse).customDescription)"
			hasError = true
			print(errorMessage)
		}
	}

	func fetchCategoryMangas(category: String) async {
		do {
			categoryRequest.httpMethod = "GET"
			categoryRequest.setValue("https://ww5.manganelo.tv/genre/\(category)", forHTTPHeaderField: "Link-Full")
			let response = try await client.fetch(type: MangaCategoryList.self, with: categoryRequest)
			mangaCategories = response.mangaLink.compactMap { $0 }
		} catch {
			errorMessage = "\((error as! ErrorResponse).customDescription)"
			hasError = true
			print(errorMessage)
		}
	}
}
