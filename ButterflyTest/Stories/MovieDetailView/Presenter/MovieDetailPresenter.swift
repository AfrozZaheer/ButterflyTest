//
//  MovieDetailPresenter.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import Foundation

class MovieDetailPresenter: MovieDetailViewToPresenterProtocol {
    
    init(view: MovieDetailPresenterToViewProtocol, itreator: MovieDetailPresenterToItreatorProtocol, router: MovieDetailPresenterToRouterProtocol, movieItem: Movie) {
        self.view = view
        self.itreator = itreator
        self.router = router
        self.movie = movieItem
    }
    
    weak var view: MovieDetailPresenterToViewProtocol?
    var itreator: MovieDetailPresenterToItreatorProtocol
    var router: MovieDetailPresenterToRouterProtocol
    
    private var movie: Movie
    
    func viewDidLoad() {
        //fetch movie details
        itreator.fetchMovieDetail(id: movie.id ?? 0)
    }
    
}

//MARK: - MovieDetailItreatorToPresenterProtocol
extension MovieDetailPresenter: MovieDetailItreatorToPresenterProtocol {
    func didFetched(movie: Movie) {
        view?.fetchedData(movie: MovieDetailModel(movie: movie))
    }
    
    func errorOccurecd(error: Error) {
        view?.showError(error: error)
    }
}
