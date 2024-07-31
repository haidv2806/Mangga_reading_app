//
//  ColorForRGB.swift
//  Manga
//
//  Created by QuyNM on 5/29/23.
//

import SwiftUI

func colorFromRGB(red: Double, green: Double, blue: Double) -> Color {
    return Color(
        red: red / 255,
        green: green / 255,
        blue: blue / 255
    )
}
