//
//  AppTextField.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 12/8/24.
//

import SwiftUI

struct AppTextField: View {
    @Binding var value: String
    
    let Text_Field_Title: String
    
    var body: some View {
        VStack (spacing: 0) {
            Text(Text_Field_Title)
                .font(.title)
                .foregroundColor(Color(hex: "#F48611"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            TextField("Enter " + Text_Field_Title, text: $value)
                .textFieldStyle(PlainTextFieldStyle())  // Để loại bỏ border mặc định
                .padding(.vertical, 8)
                .background(
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 0)
                            .strokeBorder(Color.black, lineWidth: 2)
                            .frame(height: 2)  // Để chỉ hiển thị border bottom
                    }
                    .padding(.bottom, -1)  // Để căn chỉnh border bottom
                )
                .padding(.bottom, 4)  // Khoảng cách dưới cùng
                .frame(maxWidth: .infinity)  // Để textfield chiếm hết chiều rộng
                .font(.title)
        }
    }
}

struct AppTextField_preview: PreviewProvider {
    static var previews: some View {
        @State var value: String = ""
        AppTextField(value: $value, Text_Field_Title: "Email")
    }
}

//#Preview {
//    AppTextField(value: <#Binding<String>#>, Text_Field_Title: "Email")
//}
