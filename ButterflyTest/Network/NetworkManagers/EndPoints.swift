//
//  MyEndPoint.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 29/12/2023.
//

import Foundation

enum MyEndPoint: URLDirectable {
    
    //MARK: - GetMovie
    case nowPlayingMovies
    case movieDetail(id: Int)
    //MARK: - Search
    case searchMovie
    
    func urlString() -> String {
     
        var endpoint = ""
        
        switch (self) {
                        
        case .nowPlayingMovies:
            endpoint = "trending/movie/day?language=en-US"
            
        case .movieDetail(let id):
            endpoint = "movie\(id)"
            
        case .searchMovie:
            endpoint = "search/movie"
        }
        
        return Constants.URLs.baseURL.rawValue + endpoint
    }
}
