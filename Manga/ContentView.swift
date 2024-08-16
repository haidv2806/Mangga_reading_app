//
//  ContentView.swift
//  Manga
//
//  Created by đông on 20/04/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    @State var selectedCategory: String = ""
    
    var body: some View {
        if isLogin {
            HomeInterface( selectedCategory: $selectedCategory)
        } else {
            SignIn()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
