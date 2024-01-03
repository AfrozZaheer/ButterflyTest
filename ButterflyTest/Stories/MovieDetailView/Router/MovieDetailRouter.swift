//
//  MovieDetailRouter.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailPresenterToRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createModule(movie: Movie) -> MovieDetailViewController {
        let view = MovieDetailViewController.initializeViewControllerInstance()
        let intreactor = MovieDetailIntreactor(apiManager: MovieApiManager())
        let router = MovieDetailRouter()
        router.view = view
        
        let presenter = MovieDetailPresenter(view: view, itreator: intreactor, router: router, movieItem: movie)
        
        intreactor.presenter = presenter
        view.presenter = presenter
        
        return view
        
    }
}
