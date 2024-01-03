//
//  MoveDetailModel.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import Foundation

class MovieDetailModel {
    
    var imageBack: String?
    var image: String?
    var title = ""
    var descp = ""
    var id: Int?
    var releseDate: String?
    
    var backDropImageURL: URL? {
        var base = Constants.URLs.imageBaseURL.rawValue
        guard let imageBack else {return nil}
        base = base + imageBack
        
        return URL(string: base)
    }
    var imageURL: URL? {
        var base = Constants.URLs.imageBaseURL.rawValue
        guard let image else {return nil}
        base = base + image
        
        return URL(string: base)
    }
    
    init(movie: Movie) {
        self.imageBack = movie.backdropPath
        self.image = movie.posterPath
        self.title = movie.title ?? ""
        self.descp = movie.overview ?? ""
        self.id = movie.id
        self.releseDate = movie.releaseDate
    }
    
}
