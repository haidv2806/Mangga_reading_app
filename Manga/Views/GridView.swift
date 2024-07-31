//
//  GridView.swift
//  Manga
//
//  Created by đông on 07/06/2023.
//

import SwiftUI

struct GridView: View {
	var imageNames: [String]
	@StateObject private var viewModel = MangaViewModel()
	@Binding var selectedCategory: String
	@State var isSelected: Bool

	let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10)
	]

    var body: some View {
		LazyVGrid(columns: columns, spacing: 10) {
			ForEach(imageNames, id: \.self) { imageName in
				Category(backgroundColor: colorFromRGB(red: 253, green: 134, blue: 47),
						 image: imageName,
						 title: imageName,
						 selectedCategory: $selectedCategory,
						 isSelected: isSelected)
				
			}
		}
		.padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
		GridView(imageNames: ["comedy", "drama", "horror", "manhua", "mature", "psychological", "sci-fi", "shoujo-ai", "slice-of-life", "supernatural"], selectedCategory: .constant(""), isSelected: false)
    }
}
