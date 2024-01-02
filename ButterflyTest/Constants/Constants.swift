//
//  Constants.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 29/12/2023.
//

import Foundation

enum Constants {
   
    //MARK: - Private Keys
    enum PrivateKeys: String {
        case TMDBApiKey = "9a3e833dd13618a1c61f01d2440e7f07"
        case TMDBApiReadAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTNlODMzZGQxMzYxOGExYzYxZjAxZDI0NDBlN2YwNyIsInN1YiI6IjY1OTFmY2ZmZGJjYWRlNzZhMWRjZjMwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8-eEMGfDMrIKoBp8hwl3ItJHepbfDSItjxHeEZz_3uo"
        
    }
    
    //MARK: - Base URLS
    enum URLs: String {
        case baseURL = "https://api.themoviedb.org/3/"
        case imageBaseURL = "https://image.tmdb.org/t/p/w500"
    }
    
    //MARK: UIViewcControllers Identifiers
    enum ViewControllerIdentifiers: String {
        case mainVC = "MainViewController"
    }
    
    //MARK: Storyboards
    enum StoryBoardsName: String {
        case main = "Main"
    }
    
}

