//
//  SplitNumberVote.swift
//  Manga
//
//  Created by QuyNM on 5/18/23.
//

import UIKit

extension String {
    func splitNumberVote() -> String {
        let vote = self.split(separator: "-").last?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ").first ?? ""
        return vote
    }
    
    func extractRating() -> String? {
        if let range = self.range(of: ":([0-9.]+)", options: .regularExpression) {
            let ratingText = self[range].replacingOccurrences(of: ":", with: "")
            return ratingText
        } else {
            return nil
        }
    }
}

func getGenres(from genre: [String]) -> String {
	let values = genre.flatMap { $0.components(separatedBy: ",") }
	if values.count >= 2 {
		var output = values.prefix(2).joined(separator: ",")
		if values.count > 2 {
			output += ",..."
		}
		return output
	}
	return genre.joined(separator: ",")
}
