//
//  MovieDetailContract.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import Foundation

protocol MovieDetailViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol MovieDetailPresenterToViewProtocol: AnyObject {
    func fetchedData(movie: MovieDetailModel)
    func showError(error: Error)
}

protocol MovieDetailPresenterToRouterProtocol {
}

protocol MovieDetailItreatorToPresenterProtocol: AnyObject {
    func didFetched(movie: Movie)
    func errorOccurecd(error: Error)
}

protocol MovieDetailPresenterToItreatorProtocol {
    func fetchMovieDetail(id: Int)
}

