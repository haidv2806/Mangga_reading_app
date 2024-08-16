//
//  SignIn.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct SignIn: View {
    @StateObject private var SignIn_PostAPI = SignInPostAPI()
    
    var body: some View {
        NavigationView {
            ZStack{
                AppBackground()
                    .opacity(0.5)
                
                VStack{
                    Spacer()
                    
                    AppName()
                    
                    
                    
                    AppTextField(value: $SignIn_PostAPI.Email, Text_Field_Title: "Email")
                    AppTextField(value: $SignIn_PostAPI.Password, Text_Field_Title: "Password")
                    
                    Button(action: {}, label: {
                        Text("Forgot your password?")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    
                    Spacer()
                    
                    if #available(iOS 15.0, *) {
                        Button(action: {
                            SignIn_PostAPI.submitData()
                        }, label: {
                            AppButton(SignInUp: "Sign In")
                        })
                        
                        NavigationLink(destination: destinationView(for: .HomeInterface(selectedCategory: .constant(""))), isActive: $SignIn_PostAPI.IsUserLoggedIn) {
                            EmptyView()
                        }
                    }
                    
                    HStack{
                        Text("Don’t have an account?")
                        
                        
                        NavigationLink(destination: destinationView(for: .SignUp)) {
                            Text("Sign Up")
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
    SignIn()
}
