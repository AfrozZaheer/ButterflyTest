//
//  HomeItreator.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation

class HomeItreator: HomePresenterToItreatorProtocol {
    
    let apiManager: MovieApiManagerProtocol
    weak var presenter: HomeItreatorToPresenterProtocol?
    
    init(apiManager: MovieApiManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func fetchMovies(txt: String?) {
        if let txetTotSearch = txt {
            //call search api
        } else {
            //call trending all movies api
            apiManager.getMovies() {[weak self] movies in
                guard let self else {return}
                guard let movies else {return}
                
                self.presenter?.didFetched(movies: movies)
                
            } failure: {[weak self] error in
                guard let self else {return}
                self.presenter?.errorOccurecd(error: error)
            }
        }
    }
}

