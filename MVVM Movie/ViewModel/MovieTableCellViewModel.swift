//
//  MovieTableCellViewModel.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 23.10.2023.
//

import Foundation
import UIKit

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id ?? 0
        self.title = movie.title ?? ""
        self.date = movie.releaseDate ?? ""
        self.rating = "\(movie.voteAverage ?? 0)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
