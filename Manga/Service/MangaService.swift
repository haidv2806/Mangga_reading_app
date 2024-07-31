//
//  MangaService.swift
//  Manga
//
//  Created by DongNH on 4/21/23.
//

import Foundation

protocol MangaService {
    func fetchMangas(from path: MangaPath, completion: @escaping (Result<MangaList, MangaError>) -> ())
}

enum MangaPath: String {
    case home = "homenelo"
    case category = "category_home"
    case detailManga = "detailmanga"
    case chapter
}

enum MangaError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
