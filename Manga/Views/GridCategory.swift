////
////  GridCategory.swift
////  Manga
////
////  Created by đông on 04/06/2023.
////
//
//import SwiftUI
//
//struct GridCategory: View {
//	@StateObject var viewModel = MangaViewModel()
//	@State private var selectedCategory: String = ""
//
//	let columns = [
//		GridItem(.flexible()),
//		GridItem(.flexible()),
//		GridItem(.flexible())
//	]
//
//	let images = ["Comedy", "Drama", "Horror", "Manhua", "Mature", "Psychological", "Sci%20fi", "Shoujo%20ai", "Slice%20of%20life", "Supernatural",
//				  "Yaoi", "Action", "Cooking", "Erotica", "Isekai", "Manhwa", "Mecha", "One%20shot", "Romance", "Seinen", "Shounen", "Tragedy", "Yuri", "Adventure", "Doujinshi", "Fantasy", "Historical", "Josei", "Martial%20arts", "Medical", "School%20life", "Shoujo", "Shounen%20ai", "Sports", "Webtoons"]
//	@State private var currentPage: Int = 0
//	var rowsPerPage: Int = 3
//	var columnsPerPage: Int = 3
//
//	var body: some View {
//		if #available(iOS 15.0, *) {
//			VStack {
//				GeometryReader { geo in
//					ScrollViewReader { scrollViewProxy in
//						ScrollView(.horizontal, showsIndicators: false) {
//							LazyHStack(spacing: 0) {
//								ForEach(0..<numberOfPages, id: \.self) { pageIndex in
//									GridView(imageNames: getPageItems(pageIndex: pageIndex), selectedCategory: $selectedCategory)
//										.frame(width: geo.size.width, height: geo.size.height)
//										.id(pageIndex)
//										.preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scrollArea")).minX)
//								}
//							}
//						}
//						.onChange(of: currentPage) { newValue in
//							withAnimation {
//								scrollViewProxy.scrollTo(newValue, anchor: .center)
//							}
//						}
//						.coordinateSpace(name: "scrollArea")
//						.onAppear {
//							scrollToPage(page: currentPage, scrollViewProxy: scrollViewProxy)
//						}
//						.frame(width: geo.size.width, height: geo.size.height)
//					}
//				}
//				PageControl(numberOfPages: numberOfPages, currentPage: $currentPage)
//					.padding(.top, 10)
//					.background(colorFromRGB(red: 253, green: 134, blue: 47))
//			}
//			.onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
//				let pageIndex = Int(offset / UIScreen.main.bounds.width)
//				currentPage = pageIndex
//			}
//		} else {
//			// Fallback on earlier versions
//		}
//	}
//	
//	var numberOfPages: Int {
//		let totalItems = images.count
//		let itemsPerPage = rowsPerPage * columnsPerPage
//		let pages = totalItems / itemsPerPage
//		return totalItems % itemsPerPage == 0 ? pages : pages + 1
//	}
//
//	func getPageItems(pageIndex: Int) -> [String] {
//		let startIndex = pageIndex * rowsPerPage * columnsPerPage
//		let endIndex = min((pageIndex + 1) * rowsPerPage * columnsPerPage, images.count)
//		let pageImages = Array(images[startIndex..<endIndex])
//		let correctName = getCorrectName(pageImages)
//		return correctName
//	}
//
//	func scrollToPage(page: Int, scrollViewProxy: ScrollViewProxy) {
//		withAnimation {
//			scrollViewProxy.scrollTo(page, anchor: .leading)
//		}
//	}
//
//	func getCorrectName(_ urlStrings: [String]) -> [String] {
//		return urlStrings.map { $0.removingPercentEncoding ?? $0
//		}
//	}
//}
//
//private struct ScrollOffsetPreferenceKey: PreferenceKey {
//	static var defaultValue: CGFloat = 0
//
//	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//		value = nextValue()
//	}
//}
//
//struct GridCategory_Previews: PreviewProvider {
//	static var previews: some View {
//		GridCategory()
//	}
//}
