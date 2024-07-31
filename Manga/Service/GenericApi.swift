//
//  GenericApi.swift
//  Manga
//
//  Created by QuyNM on 5/11/23.
//

import Foundation

protocol GenericApi {
    var session: URLSession { get }
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T
}

extension GenericApi {
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ErrorResponse.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw ErrorResponse.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(type, from: data)
        } catch {
			print("JSON decoding error: \(error)")
            throw ErrorResponse.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
