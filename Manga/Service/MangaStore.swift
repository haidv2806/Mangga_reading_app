//
//  MangaStore.swift
//  Manga
//
//  Created by DongNH on 4/21/23.
//

import Foundation

class MangaStore: MangaService {
    static let shared = MangaStore()
    private init() {}

    private let baseURL = "http://14.225.7.221:1989"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder

    func fetchMangas(from path: MangaPath, completion: @escaping (Result<MangaList, MangaError>) -> ()) {
        guard let url = URL(string: "\(baseURL)/\(path.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, completion: @escaping (Result<D, MangaError>) -> ()) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("https://ww5.manganelo.tv/home", forHTTPHeaderField: "Link-Full")
        urlSession.dataTask(with: request) { [ weak self] (data, response, error) in
            guard let self = self else { return }

            if error != nil {
                self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }

            guard let data = data else {
                self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }

            do {
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, MangaError>, completion: @escaping (Result<D, MangaError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
