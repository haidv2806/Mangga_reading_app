//
//  ImageToBase64.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 16/8/24.
//

import SwiftUI

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

//let img = //get UIImage from wherever
//let base64 = img.base64
//let rebornImg = base64?.imageFromBase64
