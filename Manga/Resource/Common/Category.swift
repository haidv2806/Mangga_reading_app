//
//  Category.swift
//  Manga
//
//  Created by QuyNM on 5/30/23.
//

import SwiftUI

struct Category: View {
	var backgroundColor: Color
	var image: String
	var title: String
	let buttonAction: () async -> Void
	@StateObject private var viewModel = MangaViewModel()
	@Binding var selectedCategory: String
	var isSelected: Bool
	
	init(backgroundColor: Color, image: String, title: String, buttonAction: @escaping () -> Void = {}, selectedCategory: Binding<String>, isSelected: Bool) {
		self.backgroundColor = backgroundColor
		self.image = image
		self.title = title
		self.buttonAction = buttonAction
		self._selectedCategory = selectedCategory
		self.isSelected = isSelected
	}
	
	var body: some View {
		Button(action: {
			selectedCategory = image
		}) {
			VStack(spacing: 5) {
				Image(image)
					.resizable()
					.frame(width: 60, height: 60)
					.padding(.bottom, 40)
				Text(title)
					.font(.system(size: 13))
					.foregroundColor(.black)
			}
			.padding()
			.frame(width: 120, height: 150)
			.background(isSelected ? backgroundColor : .white)
			
			.overlay(
				RoundedRectangle(cornerRadius: 25)
					.stroke(Color.gray.opacity(0.5), lineWidth: 2)
			)
		}
	}
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
		Category(backgroundColor: Color.green, image: "Psychological", title: "Psychological", selectedCategory: .constant(""), isSelected: false)
    }
}
