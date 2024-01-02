//
//  HomeModel.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import Foundation

class HomeMovieModel {
    
    var image: String?
    var title = ""
    var descp = ""
    
    var imageURL: URL? {
        var base = Constants.URLs.baseURL.rawValue
        guard let image else {return nil}
        base = base + image
        
        return URL(string: base)
    }
    
    init(movie: Movie) {
        self.image = movie.posterPath
        self.title = movie.title ?? ""
        self.descp = movie.overview ?? ""
    }
}
