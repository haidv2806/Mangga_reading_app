//
//  Client.swift
//  Manga
//
//  Created by QuyNM on 5/11/23.
//

import Foundation

final class Client: GenericApi {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }
}
