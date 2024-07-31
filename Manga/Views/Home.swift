//
//  Home.swift
//  Manga
//
//  Created by DongNH on 4/21/23.
//

import SwiftUI

struct Home: View {
	@Environment(\.colorScheme) var colorScheme
	@State private var activeTag = "All"
	@State private var carouselMode: Bool = false
	@Namespace private var animation
	@Binding var selectedCategory: String
	@State private var showDetailView: Bool = false
	@State private var selectedManga: MangaCategory?
	@State private var animateCurrentManga: Bool = false
	@StateObject var viewModel = MangaViewModel()

	let imageLoader = ImageLoader()
	@StateObject private var lastestState = MangaListState()

	var body: some View {
		if #available(iOS 15.0, *) {
			VStack(spacing: 15) {
				HStack {
					Text(selectedCategory)
						.font(.largeTitle.bold())

					Text("Recommend")
						.fontWeight(.semibold)
						.padding(.leading, 15)
						.foregroundColor(.gray)
						.offset(y: 2)

					Spacer(minLength: 10)
					Menu {
						Button("Toggle ") {

						}
					} label: {
						Image(systemName: "ellipsis")
							.rotationEffect(.init(degrees: -90))
							.foregroundColor(.gray)
					}
				}
				tagView()

					ScrollView(showsIndicators: false) {
						VStack {
							MangaCardView1(mangas: viewModel.mangaCategories)
								.frame(height: 220)

						}
						.background {
							ScrollviewDetector(carouselMode: $carouselMode, totalCardCount: viewModel.mangaCategories.count)
						}
						.padding()
					}
					.task {
						await viewModel.fetchCategoryMangas(category: selectedCategory)
					}
					.coordinateSpace(name: "SCROLLVIEW")
//				.padding(.top, 15)
			}
			.overlay {
				if let selectedManga, showDetailView {
					DetailView(show: $showDetailView, animation: animation, manga: selectedManga, link: selectedManga.link)
						.transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
				}
			}
			.onChange(of: showDetailView) { newValue in
				if !newValue {
					withAnimation(.easeInOut(duration: 0.15).delay(0.3)) {
						animateCurrentManga = false
					}
				}
			}
		} else {

		}
	}


	func bottomPadding(_ size: CGSize = .zero) -> CGFloat {
		let cardHeight: CGFloat = 220
		let scrollviewHeight: CGFloat = size.height

		return scrollviewHeight - cardHeight - 40
	}

	@ViewBuilder
	func MangaCardView1(mangas: [MangaCategory]) -> some View {
		if #available(iOS 15.0, *) {
			ForEach(mangas) { manga in
				GeometryReader { proxy in
						let size = proxy.size
						let rect = proxy.frame(in: .named("SCROLLVIEW"))
						HStack(spacing: -25) {
							VStack(alignment: .leading, spacing: 6) {
								Text(manga.title)
									.font(.title3)
									.fontWeight(.semibold)
									.lineLimit(2)

								Text(manga.authorHome)
									.font(.callout)
									.foregroundColor(.gray)
							}
							.frame(width: size.width / 2, height: size.height * 0.8)
							.background(
								RoundedRectangle(cornerRadius: 10, style: .continuous)
									.fill(Color.white)
									.shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
									.shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
							)
							.zIndex(1)

							ZStack {
								if !(showDetailView && selectedManga?.id == manga.id) {
									LoadImage(mangaCategory: manga)
										.frame(width: size.width / 2, height: size.height)
										.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
										.matchedGeometryEffect(id: manga.id, in: animation)
										.shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
										.shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
								}
							}
							.frame(maxWidth: .infinity, maxHeight: .infinity)
						}
						.rotation3DEffect(
							.init(degrees: convertOffsetToRotation(rect)),
							axis: (x: 1, y: 0, z: 0),
							anchor: .bottom,
							anchorZ: 1,
							perspective: 0.8
						)
						.frame(width: size.width)
						.onTapGesture {
							withAnimation(.easeInOut(duration: 0.2)) {
								animateCurrentManga = true
								selectedManga = manga
							}
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
								withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
									showDetailView = true
								}
							}
						}
					}
			}
			.frame(height: 220)
		}
	}

	func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
		let cardHeight = rect.height + 20
		let minY = rect.minY - 20
		let progress = minY < 0 ? (minY / cardHeight) : 0
		let constrainedProgress = min(-progress, 1.0)
		return constrainedProgress * 90
	}

	@ViewBuilder
	func tagView() -> some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 10) {
				ForEach(tags, id: \.self) { tag in
					if #available(iOS 15.0, *) {
						Text(tag)
							.font(.caption)
							.padding(.horizontal, 12)
							.padding(.vertical, 5)
							.background {
								if activeTag == tag {
									Capsule()
										.fill(Color.blue)
										.matchedGeometryEffect(id: "ACTIVETAB", in: animation)
								} else {
									Capsule()
										.fill(.gray.opacity(0.2))
								}
							}
							.foregroundColor(activeTag == tag ? Color.white : Color.gray)
							.onTapGesture {
								withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
									activeTag = tag
								}
							}
					} else {
						// Fallback on earlier versions
					}
				}
			}
			.padding(.horizontal, 15)
		}
	}
}

var tags: [String] = ["ALL", "Comedy", "Drama", "Horror", "Manhua", "Mature", "Mystery", "Psychological", "Sci fi", "Shoujo ai", "Slice of life", "Supernatural", "Yaoi", "Newest", "Completed", "Action", "Cooking", "Erotica", "Isekai", "Manhwa", "Mecha", "One shot", "Romance", "Seinen", "Shounen", "Tragedy", "Yuri", "Top view", "Ongoing", "Adventure", "Doujinshi", "Fantasy", "Historical", "Josei", "Martial arts", "Medical", "School life", "Shoujo", "Shounen ai", "Sports", "Webtoons"]

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home(selectedCategory: .constant(""))
	}
}

