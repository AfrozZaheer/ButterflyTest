//
//  Contract.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import Foundation
import UIKit

protocol HomeViewToPresenterProtocol: AnyObject {
    func getAllMovies(txt: String?)
    func getNextMovies(txt: String?)
    func moveToMovieDetail(nav: UINavigationController, movie: HomeMovieModel)
}

protocol HomePresenterToViewProtocol: AnyObject {
    func fetchedResults(movies: [HomeMovieModel])
    func showError(error: Error)
}

protocol HomePresenterToRouterProtocol {
    func moveToDetailViewController(nav: UINavigationController, movie: Movie)
}

protocol HomeItreatorToPresenterProtocol: AnyObject {
    func didFetched(movies: [Movie], paginationData: Pagination)
    func errorOccurecd(error: Error)
}

protocol HomePresenterToItreatorProtocol {
    func fetchMovies(txt: String?, page: Int)
}
