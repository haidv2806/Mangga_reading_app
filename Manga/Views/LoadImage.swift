//
//  LoadImage.swift
//  Manga
//
//  Created by QuyNM on 4/21/23.
//

import SwiftUI

struct LoadImage: View {
	let mangaCategory: MangaCategory
	@StateObject var imageLoader = ImageLoader()

	var body: some View {
		Group {
			Rectangle()
				.fill(Color.gray.opacity(0.3))

			if self.imageLoader.image != nil {
				Image(uiImage: self.imageLoader.image ?? UIImage())
					.resizable()
					.aspectRatio(contentMode: .fill)
			}
		}
		.onAppear {
			self.imageLoader.loadImage(with: self.mangaCategory.poster)
		}
	}
}

#Preview {
    ContentView()
}
