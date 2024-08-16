//
//  SignInPostAPI.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 13/8/24.
//

import SwiftUI
import Combine

class SignInPostAPI: ObservableObject {
    @Published var Email: String = ""
    @Published var Password: String = ""
    @Published var IsUserLoggedIn = false
    
    private let baseURL = "https://manga.gachmen.org"
//    private let urlSession = URLSession.shared
//    private let jsonDecoder = Utils.jsonDecoder

    func submitData() {
        // Thay thế URL với URL của server của bạn
        guard let url = URL(string: "\(baseURL)/login") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "email": Email,
            "password": Password
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
                    let response = try decoder.decode(SignInResponse.self, from: data)
                    print(response.ketqua)
                    
                    if response.ketqua == "Login success" {
                        self.IsUserLoggedIn = true
                        print(self.IsUserLoggedIn)
                        
                        UserDefaults.standard.set(self.Email, forKey: "email")
                        UserDefaults.standard.set(self.Password, forKey: "password")
                        UserDefaults.standard.set(self.IsUserLoggedIn, forKey: "isUserLoggedIn")
                        UserDefaults.standard.set(response.user.id_user, forKey: "idUser")
                        UserDefaults.standard.set(response.user.user_name, forKey: "userName")
                        UserDefaults.standard.set(response.user.link_avatar, forKey: "linkAvatar")
                        
//                        print(UserDefaults.standard.dictionaryRepresentation())
                    }
                    
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}

struct SignInResponse: Codable {
    let ketqua: String
    let user: UserData
}
