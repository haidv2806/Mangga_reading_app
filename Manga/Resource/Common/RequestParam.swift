//
//  RequestParam.swift
//  Manga
//
//  Created by đông on 10/06/2023.
//

import SwiftUI

var baseURL = "http://14.225.7.221:1983"

func createURLRequest(with path: String, headerValue: String) -> URLRequest {
	let urlString = "\(baseURL)\(path)"
	let url = URL(string: urlString)!
	var request = URLRequest(url: url)
	request.httpMethod = "GET"
	request.setValue(headerValue, forHTTPHeaderField: "Link-Full")
	return request
}
