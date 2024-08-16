//
//  SignUp.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct SignUp: View {
    @StateObject private var SignUp_PostAPI = SignUpPostAPI()
    
    var body: some View {
        NavigationView {
            ZStack{
                AppBackground()
                    .opacity(0.5)
                
                VStack{
                    Spacer()
                    
                    AppName()
                    
                    AppTextField(value: $SignUp_PostAPI.Name, Text_Field_Title: "Name")
                    AppTextField(value: $SignUp_PostAPI.Email, Text_Field_Title: "Email")
                    AppTextField(value: $SignUp_PostAPI.Password, Text_Field_Title: "Password")

                    
                    Spacer()
                    
                    NavigationLink(destination: destinationView(for: .HomeInterface(selectedCategory: .constant("")))) {
                        AppButton(SignInUp: "Sign Up")
                    }
                    
                    HStack{
                        Text("Don’t have an account?")
                        
                        NavigationLink(destination: destinationView(for: .SignIn)) {
                            Text("Sign In")
                                .foregroundColor(Color(hex: "#F48611"))
                        }
                    }
                    .font(.title3)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    SignUp()
}
