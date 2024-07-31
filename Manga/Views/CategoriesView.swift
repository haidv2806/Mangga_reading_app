//
//  CategoriesView.swift
//  Manga
//
//  Created by QuyNM on 5/30/23.
//

import SwiftUI

struct CategoriesView: View {
	@StateObject var viewModel = MangaViewModel()
	@State public var selectedCategory: String = ""
	@State public var selectedItem: String = ""

	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]

	let images = ["Comedy", "Drama", "Horror", "Manhua", "Mature", "Psychological", "Sci%20fi", "Shoujo%20ai", "Slice%20of%20life", "Supernatural",
				  "Yaoi", "Action", "Cooking", "Erotica", "Isekai", "Manhwa", "Mecha", "One%20shot", "Romance", "Seinen", "Shounen", "Tragedy", "Yuri", "Adventure", "Doujinshi", "Fantasy", "Historical", "Josei", "Martial%20arts", "Medical", "School%20life", "Shoujo", "Shounen%20ai", "Sports", "Webtoons"]
	@State private var currentPage: Int = 0
	var rowsPerPage: Int = 3
	var columnsPerPage: Int = 3

	var body: some View {
		NavigationView {
			if #available(iOS 15.0, *) {
				VStack(spacing: 10) {
					Text("LET US KNOW!")
						.font(.system(size: 40))
						.bold()
					Text("Choose your genre to find your favourite manga here!")
						.foregroundColor(colorFromRGB(red: 117, green: 117, blue: 117))
//					GridCategory()
					if #available(iOS 15.0, *) {
						VStack {
							GeometryReader { geo in
								ScrollViewReader { scrollViewProxy in
									ScrollView(.horizontal, showsIndicators: false) {
										LazyHStack(spacing: 0) {
											ForEach(0..<numberOfPages, id: \.self) { pageIndex in
												GridView(imageNames: getPageItems(pageIndex: pageIndex), selectedCategory: $selectedCategory, isSelected: false)
													.frame(width: geo.size.width, height: geo.size.height)
													.id(pageIndex)
													.preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scrollArea")).minX)
											}
										}
									}
									.onChange(of: currentPage) { newValue in
										withAnimation {
											scrollViewProxy.scrollTo(newValue, anchor: .center)
										}
									}
									.coordinateSpace(name: "scrollArea")
									.onAppear {
										scrollToPage(page: currentPage, scrollViewProxy: scrollViewProxy)
									}
									.frame(width: geo.size.width, height: geo.size.height)
								}
							}
							PageControl(numberOfPages: numberOfPages, currentPage: $currentPage)
								.padding(.top, 10)
								.background(colorFromRGB(red: 253, green: 134, blue: 47))
						}
						.onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
							let pageIndex = Int(offset / UIScreen.main.bounds.width)
							currentPage = pageIndex
						}
					} else {
						// Fallback on earlier versions
					}

					//
					GeometryReader { geo in
						VStack(spacing: 10) {
							NavigationLink(destination: Home(selectedCategory: $selectedCategory)) {
								Text("Read Now")
									.frame(minWidth: 0, maxWidth: geo.size.width * 0.5, maxHeight: 30)
									.font(.system(size: 18))
									.padding()
									.foregroundColor(.white)
									.overlay(
										RoundedRectangle(cornerRadius: 25)
											.stroke(Color.white, lineWidth: 2)
									)
							}
							.background(colorFromRGB(red: 253, green: 134, blue: 47))
							.cornerRadius(25)
							.padding(.horizontal, (geo.size.width - geo.size.width * 0.5) / 2)

//							NavigationLink(destination: Home(selectedCategory: $selectedCategory)) {
//								Text("Skip for now")
//							}
							.navigationTitle("")
							.navigationBarBackButtonHidden(true)
						}
					}
					.frame(maxHeight: 100)

				}
			} else {
				// Fallback on earlier versions
			}
		}
	}

	var numberOfPages: Int {
		let totalItems = images.count
		let itemsPerPage = rowsPerPage * columnsPerPage
		let pages = totalItems / itemsPerPage
		return totalItems % itemsPerPage == 0 ? pages : pages + 1
	}

	func getPageItems(pageIndex: Int) -> [String] {
		let startIndex = pageIndex * rowsPerPage * columnsPerPage
		let endIndex = min((pageIndex + 1) * rowsPerPage * columnsPerPage, images.count)
		let pageImages = Array(images[startIndex..<endIndex])
		let correctName = getCorrectName(pageImages)
		return correctName
	}

	func scrollToPage(page: Int, scrollViewProxy: ScrollViewProxy) {
		withAnimation {
			scrollViewProxy.scrollTo(page, anchor: .leading)
		}
	}

	func getCorrectName(_ urlStrings: [String]) -> [String] {
		return urlStrings.map { $0.removingPercentEncoding ?? $0
		}
	}
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
	static var defaultValue: CGFloat = 0

	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}

struct CategoriesView_Previews: PreviewProvider {
	static var previews: some View {
		CategoriesView()
	}
}
