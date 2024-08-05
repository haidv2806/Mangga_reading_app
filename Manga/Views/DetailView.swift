//
//  DetailView.swift
//  Manga
//
//  Created by QuyNM on 5/8/23.
//

import SwiftUI

struct DetailView: View {
	@Binding var show: Bool
	var animation: Namespace.ID
	var manga: MangaCategory
	var link: String = ""
	let imageLoader = ImageLoader()
	@State private var animationContent: Bool = false
	@ObservedObject var mangaDetailState = MangaDetailState()
	@State private var offsetAnimation: Bool = false
	@StateObject var viewModel = MangaViewModel()

	var body: some View {
		if #available(iOS 15.0, *) {
			VStack(spacing: 15) {
				ZStack(alignment: .topLeading) {
					imageHeader
					header
						.padding(.top, 90)
						.padding(.leading, 35)
				}
				ZStack(alignment: .bottom) {
					detail
						.cornerRadius(50, corners: [.topLeft, .topRight])
					readButton
						.padding(.bottom, 30)
						.background {
							LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1.5), Color.white.opacity(0.1)]), startPoint: .bottom, endPoint: .top)
								.blur(radius: 8)
						}
				}
                .padding(.top, 55)
			}
			.navigationBarBackButtonHidden(true)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
			.background {
				Rectangle()
					.fill(.clear)
					.ignoresSafeArea()
					.opacity(animationContent ? 1 : 0)
			}
			.edgesIgnoringSafeArea(.all)
			.onAppear {
				withAnimation(.easeInOut(duration: 0.35)) {
					animationContent = true
				}

				withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
					offsetAnimation = true
				}
			}
			.task {
				await viewModel.fetchDetailManga(link: link)
			}
		} else {

		}
	}
}

extension DetailView {
	var imageHeader: some View {
		GeometryReader {
			let size = $0.size
			ZStack {
				MangaDetailImage(imageLoader: imageLoader, imageURL: self.manga.poster)
					.frame(width: size.width, height: 420)
				//Custom Corner Shape
					.clipShape(CustomCorner(corner: [.topRight, .bottomRight], radius: 20))
					.matchedGeometryEffect(id: manga.id, in: animation)

				Blur(style: .light)
					.frame(width: size.width, height: 420)

				MangaDetailImage(imageLoader: imageLoader, imageURL: self.manga.poster)
					.frame(width: size.width, height: 420)
				//Custom Corner Shape
					.clipShape(CustomCorner(corner: [.topRight, .bottomRight], radius: 20))
					.matchedGeometryEffect(id: manga.id, in: animation)
					.mask(
						LinearGradient(gradient: Gradient(stops: [
							.init(color: Color.white, location: 0.3),
							.init(color: Color.white, location: 0.5),
							.init(color: Color.white.opacity(0), location: 1.0)
						]), startPoint: .bottom, endPoint: .top)
					)

			}
		}
		.frame(height: 270)
	}


	@available(iOS 15.0, *)
	var header: some View {
		Button {
			withAnimation(.easeInOut(duration: 0.2)) {
				offsetAnimation = false
			}

			withAnimation(.easeInOut(duration: 0.35)) {
				animationContent = true
				show = false
			}
		} label: {
			Image(systemName: "chevron.left")
				.font(.title3)
				.foregroundColor(.black)
				.contentShape(Circle())
		}
		.padding([.leading, .vertical], 18)
		.frame(maxWidth: 50, maxHeight: 50 ,alignment: .leading)
		.background(.white)
		.opacity(animationContent ? 1 : 0)
		.cornerRadius(20)
	}

	var detail: some View {
		VStack(spacing: 10) {
			HStack(spacing: 6) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.green)
                
				let genres = getGenres(from: viewModel.mangaDetail.categories)
				Text(genres)
					.foregroundColor(colorFromRGB(red: 143, green: 143, blue: 143))
					.font(.system(size: 15))

				Spacer()

				Image(systemName: "hand.thumbsup.fill")
					.foregroundColor(.red)
				let vote = viewModel.mangaDetail.Rating.splitNumberVote()
				Text(vote)
				Image(systemName: "eye")
					.foregroundColor(.gray)
				Text(viewModel.mangaDetail.View)
			}
			.frame(maxWidth: .infinity ,alignment: .trailing)
			.padding(.top, 30)
			.padding([.leading, .trailing], 25)

			VStack(alignment: .leading, spacing: 10) {
				Text(manga.title)
					.font(.title)
					.fontWeight(.semibold)

				HStack(spacing: 10) {
					let rateNumber = viewModel.mangaDetail.Rating.extractRating()
					let rating = (rateNumber as? NSString)?.integerValue
					let ratingText = (0..<(rating ?? 0)).reduce("") { (acc, _) -> String in
						return acc + "★"
					}
					Text(ratingText)
						.foregroundColor(Color.yellow)
					Text("|")
					Text("By \(manga.authorHome)")
						.font(.callout)
						.foregroundColor(.black.opacity(0.8))
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.leading, 20)
			.offset(y: offsetAnimation ? 0 : 100)
			.opacity(offsetAnimation ? 1 : 0)

			ScrollView(.vertical, showsIndicators: false) {
				Text(viewModel.mangaDetail.Description)
					.font(.system(size: 20))
                    .foregroundColor(colorFromRGB(red: 147, green: 147, blue: 147))
			}
			.padding(.top, 15)
			.padding([.leading, .trailing], 15)
		}
		.background(Color.white)
	}

    var readButton: some View {
        PreviewContentBar()
    }
}

struct MangaDetailImage: View {
	@ObservedObject var imageLoader : ImageLoader
	let imageURL : URL

	var body: some View {
		ZStack {
			Rectangle().fill(Color.gray.opacity(0.3))
			if self.imageLoader.image != nil {
				Image(uiImage: self.imageLoader.image!)
					.resizable()
					.aspectRatio(contentMode: .fill)
			}
		}
		.onAppear {
			self.imageLoader.loadImage(with: self.imageURL)
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

