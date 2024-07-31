//
//  MangaCardView.swift
//  Manga
//
//  Created by đông on 25/04/2023.
//

import SwiftUI

struct MangaCardView: View {
	let mangas: [MangaLink]
	@ObservedObject var imageLoader = ImageLoader()
	@Namespace private var animation

	@State private var showDetailView: Bool = false
	@State private var selectedManga: MangaLink?
	@State private var animateCurrentManga: Bool = false

    var body: some View {
		ForEach(mangas) { manga in
			GeometryReader {
				let size = $0.size
				let rect = $0.frame(in: .named("SCROLLVIEW"))
				HStack(spacing: -25) {
					VStack(alignment: .leading, spacing: 6) {
						if #available(iOS 15.0, *) {
							Text(manga.title)
								.font(.title3)
								.fontWeight(.semibold)
						} else {
							// Fallback on earlier versions
						}

						Text(manga.authorHome)
							.font(.title)
					}
					.frame(width: size.width / 2, height: size.height * 0.8)
					.zIndex(1)
//					.offset(x: animateCurrentManga && selectedManga?.id == manga.id ? -20 : 0)
                    
//                    if !(showDetailView && selectedManga?.id == manga.id) {
//                        LoadImage(mangaLink: manga)
//                            .frame(width: size.width / 2)
//                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                            .matchedGeometryEffect(id: manga.id, in: animation)
//                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
//                            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    }
//                        .rotation3DEffect(.init(degrees: convertOffsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .bottom, anchorZ: 1, perspective: 0.8)
//                        .frame(width: size.width)
//                        .onTapGesture {
//                            withAnimation(.easeInOut(duration: 0.2)) {
//                                animateCurrentMovie = true
//                                selectedManga = manga
//                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
//                                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
//                                    showDetailView = true
//                                }
//                            }
//                        }
				}
			}
//            .overlay {
		}
    }
    
    func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height + 20
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
}

struct MangaCardView_Previews: PreviewProvider {
    static var previews: some View {
		MangaCardView(mangas: MangaLink.stubbedMangas)
    }
}
