//
//  Contract.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import Foundation
import UIKit

protocol HomeViewToPresenterProtocol: AnyObject {
    
    init(view: HomePresenterToViewProtocol, itreator: HomePresenterToItreatorProtocol, router: HomePresenterToRouterProtocol)
    
    var view: HomePresenterToViewProtocol? {get set}
    var itreator: HomePresenterToItreatorProtocol {get set}
    var router: HomePresenterToRouterProtocol {get set}
    
    func getAllMovies(txt: String?)
    func getNextMovies(txt: String?)
    func moveToMovieDetail(movie: HomeMovieModel)
}

protocol HomePresenterToViewProtocol: AnyObject {
    var presenter: HomeViewToPresenterProtocol? {get set}
    func fetchedResults(movies: [HomeMovieModel])
    func showError(error: Error)
}

protocol HomePresenterToRouterProtocol {
    var view: UIViewController? {get set}
    func moveToDetailViewController(movie: Movie)
}

protocol HomeIntreactorToPresenterProtocol: AnyObject {
    func didFetched(movies: [Movie], paginationData: Pagination)
    func errorOccurecd(error: Error)
}

protocol HomePresenterToItreatorProtocol {
    var apiManager: MovieApiManagerProtocol {get set}
    var presenter: HomeIntreactorToPresenterProtocol?{get set}
    
    func fetchMovies(txt: String?, page: Int)
}
