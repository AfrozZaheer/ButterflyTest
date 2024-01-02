//
//  Movie.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation
import ObjectMapper

class Movie: NSObject, Mappable {
    
    var adult: Bool?
    var backdropPath: String?
    var id: Int?
    var title: String?
    var originalLanguage: OriginalLanguage?
    var originalTitle, overview, posterPath: String?
    var mediaType: MediaType?
    var genreIDS: [Int]?
    var popularity: Double?
    var releaseDate: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        adult <- map[CodingKeys.adult.rawValue]
        backdropPath <- map[CodingKeys.backdropPath.rawValue]
        id <- map[CodingKeys.id.rawValue]
        title <- map[CodingKeys.title.rawValue]
        originalLanguage <- map[CodingKeys.originalLanguage.rawValue]
        originalTitle <- map[CodingKeys.originalTitle.rawValue]
        overview <- map[CodingKeys.overview.rawValue]
        posterPath <- map[CodingKeys.posterPath.rawValue]
        mediaType <- map[CodingKeys.mediaType.rawValue]
        genreIDS <- map[CodingKeys.genreIDS.rawValue]
        popularity <- map[CodingKeys.popularity.rawValue]
        releaseDate <- map[CodingKeys.releaseDate.rawValue]
        video <- map[CodingKeys.video.rawValue]
        voteAverage <- map[CodingKeys.voteAverage.rawValue]
        voteCount <- map[CodingKeys.voteCount.rawValue]

    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case fr = "fr"
    case ja = "ja"
}
