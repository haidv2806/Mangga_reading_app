//
//  SignIn.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        NavigationView {
            ZStack{
                AppBackground()
                    .opacity(0.5)
                
                VStack{
                    Spacer()
                    
                    AppName()
                    
                    
                    
                    AppTextField(Text_Field_Title: "Email")
                    AppTextField(Text_Field_Title: "Password")
                    
                    Button(action: {}, label: {
                        Text("Forgot your password?")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    
                    Spacer()
                    
                    AppButton(SignInUp: "Sign In")
                    
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
