//
//  SignUpPostAPI.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 13/8/24.
//


import SwiftUI
import Combine

class SignUpPostAPI: ObservableObject {
    @Published var Name: String = ""
    @Published var Email: String = ""
    @Published var Password: String = ""
    @Published var link_avatar: String = "https://backend.phoenix.id.vn/accounts/profile/avatar.jpg"
    @Published var ip_register: String = ""
    @Published var device_name_register: String = UIDevice.current.name
    
    private let baseURL = "https://manga.gachmen.org"
//    private let urlSession = URLSession.shared
//    private let jsonDecoder = Utils.jsonDecoder

    func submitData() {
        // Thay thế URL với URL của server của bạn
        guard let url = URL(string: "\(baseURL)/register") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "email": Email,
            "user_name": Name,
            "password": Password,
            "link_avatar": link_avatar,
            "ip_register": ip_register,
            "device_name_register": device_name_register,
        ]
        print(body)
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Xử lý phản hồi từ server nếu cần
            if let data = data {
                do {
//                    print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(SignUpResponse.self, from: data)
                    print(response.user_name)
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}

struct SignUpResponse: Codable {
    let email: String
    let user_name: String
    let password: String
    let link_avatar: String
    let ip_register: String
    let device_name_register: String
}

