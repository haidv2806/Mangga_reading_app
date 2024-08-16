//
//  AppButton.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct AppButton: View {
    let SignInUp: String
    var body: some View {
            Text(SignInUp)
                .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(hex: "#F48611"))
                .clipShape(.rect(cornerRadius: 40))
                .glowBorder(color: Color(hex: "#F48611"), lineWidth: 5)
    }
}

#Preview {
    AppButton(SignInUp: "Sign Up")
}
