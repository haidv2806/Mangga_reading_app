//
//  Base64ToImage.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 16/8/24.
//

import Foundation
import SwiftUI

extension Image {
    init?(base64String: String) {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        self = Image(uiImage: uiImage)
    }
}
