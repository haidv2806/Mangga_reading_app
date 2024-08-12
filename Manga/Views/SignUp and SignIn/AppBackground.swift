//
//  AppBackground.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        Image("Start")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    AppBackground()
}
