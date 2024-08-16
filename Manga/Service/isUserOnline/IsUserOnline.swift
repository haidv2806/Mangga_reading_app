//
//  IsUserOnline.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 16/8/24.
//

import Foundation

class MyClass {
    private var idUser = UserDefaults.standard.string(forKey: "idUser")
    private let baseURL = "https://manga.gachmen.org"
    var timer: Timer?

    

    func startTimer() {
        // Schedule a timer to run the function every 60 seconds (1 minute)
        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(runEveryMinute), userInfo: nil, repeats: true)
    }

    @objc func runEveryMinute() {
        print("Function is running every minute!")
        
        guard let url = URL(string: "\(baseURL)/api/online/\(String(describing: idUser))") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "TimeOnline": 1
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Failed to serialize JSON: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }

            if let data = data {
                print("Response data: \(String(data: data, encoding: .utf8) ?? "No data")")
            }
        }
        
        task.resume()
    }

    func stopTimer() {
        timer?.invalidate()  // Stop the timer
    }
}
