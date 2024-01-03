//
//  MovieDetailIntreactor.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import Foundation

class MovieDetailIntreactor: MovieDetailPresenterToItreatorProtocol {
    
    let apiManager: MovieApiManagerProtocol
    weak var presenter: MovieDetailItreatorToPresenterProtocol?
    
    init(apiManager: MovieApiManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func fetchMovieDetail(id: Int) {
        apiManager.getMovieDetails(id: id) {[weak self] movie in
            guard let self else {return}
            guard let movie else {return}
            
            self.presenter?.didFetched(movie: movie)
            
        } failure: {[weak self] error in
            guard let self else {return}
            self.presenter?.errorOccurecd(error: error)
        }
    }
}
