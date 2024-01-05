//
//  MockHomePresenter.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import Foundation
@testable import ButterflyTest


class MockHomePresenter: HomeViewToPresenterProtocol, HomeIntreactorToPresenterProtocol {
    
    required init(view: HomePresenterToViewProtocol, itreator: HomePresenterToItreatorProtocol, router: HomePresenterToRouterProtocol) {
        self.view = view
        self.itreator = itreator
        self.router = router
    }
    
    weak var view: HomePresenterToViewProtocol?
    var itreator: HomePresenterToItreatorProtocol
    var router: HomePresenterToRouterProtocol
    
    func getAllMovies(txt: String?) {
        itreator.fetchMovies(txt: txt, page: 1)
    }
    
    func getNextMovies(txt: String?) {
        
    }
    
    func moveToMovieDetail(movie: ButterflyTest.HomeMovieModel) {
        
    }
    
    func didFetched(movies: [ButterflyTest.Movie], paginationData: ButterflyTest.Pagination) {
        view?.fetchedResults(movies: [HomeMovieModel(movie: movies.first!)])
    }
    
    func errorOccurecd(error: Error) {
        
    }
    
    
}
