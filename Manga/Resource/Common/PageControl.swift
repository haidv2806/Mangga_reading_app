//
//  PageControl.swift
//  Manga
//
//  Created by đông on 05/06/2023.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
	var numberOfPages: Int
	@Binding var currentPage: Int

	func makeUIView(context: Context) -> UIPageControl {
		let pageControl = UIPageControl()
		pageControl.numberOfPages = numberOfPages
		pageControl.currentPage = currentPage
		pageControl.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
		return pageControl
	}

	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = currentPage
	}

	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}

	class Coordinator: NSObject {
		var parent: PageControl

		init(_ pageControl: PageControl) {
			self.parent = pageControl
		}

		@objc func updateCurrentPage(sender: UIPageControl) {
			parent.currentPage = sender.currentPage
		}
	}
}
