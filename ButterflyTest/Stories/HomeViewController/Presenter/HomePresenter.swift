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
    
    private var pagingData = Pagination()
    private var movies = [Movie]()

    // MARK: - HomeViewToPresenterProtocol
    func getAllMovies(txt: String?) {
        pagingData.currentPage = 1
        movies.removeAll()
        
        itreator.fetchMovies(txt: txt, page: pagingData.currentPage)
    }
    
    func getNextMovies(txt: String?) {
        if pagingData.shouldFetchNext() {
            itreator.fetchMovies(txt: txt, page: pagingData.currentPage + 1)
        }
    }
    
    func didClickedOn(movie: HomeMovieModel) {
        if let mov = self.movies.first(where: {$0.id == movie.id}) {
            router.moveToDetailViewController(nav: <#T##UINavigationController#>, movie: mov)
        }
    }
    
    //MARK: - Private methods
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
    func didFetched(movies: [Movie], paginationData: Pagination) {
        self.movies.append(contentsOf: movies)
        self.pagingData = paginationData
        view.fetchedResults(movies: convertDataForView(movies: self.movies))
    }

    
    func errorOccurecd(error: Error) {
        view.showError(error: error)
    }
}

