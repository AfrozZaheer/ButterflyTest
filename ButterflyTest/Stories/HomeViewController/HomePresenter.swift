//
//  HomePresenter.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    
    init(view: HomePresenterToViewProtocol, itreator: HomePresenterToItreatorProtocol, router: HomePresenterToRouterProtocol) {
        self.view = view
        self.itreator = itreator
        self.router = router
    }
    
    var view: HomePresenterToViewProtocol
    var itreator: HomePresenterToItreatorProtocol
    var router: HomePresenterToRouterProtocol
    
    func searchForMovieName(txt: String) {
        itreator.fetchMovies(txt: txt)
    }
    
    func getAllMovies() {
        itreator.fetchMovies(txt: nil)
    }
    
    deinit {
        print("asd")
    }
    
    private func convertDataForView(movies: [Movie]) -> [HomeMovieModel] {
        var model = [HomeMovieModel]()
        movies.forEach { movie in
            let home = HomeMovieModel(movie: movie)
            model.append(home)
        }
        return model
    }
}

extension HomePresenter: HomeItreatorToPresenterProtocol {
    func didFetched(movies: [Movie]) {
        view.fetchedResults(movies: convertDataForView(movies: movies))
    }
    
    func errorOccurecd(error: Error) {
        view.showError(error: error)
    }
}

