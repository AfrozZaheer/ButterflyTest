//
//  HomeRouter.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation
import UIKit

class HomeRouter {
    
    weak var view: UIViewController?
    
    static func createModule() -> HomeViewController {
        let view = HomeViewController.initializeViewControllerInstance()
        let itreator = HomeIntreactor(apiManager: MovieApiManager())
        let router = HomeRouter()
        router.view = view
        
        let presenter = HomePresenter(view: view, itreator: itreator, router: router)
        
        view.presenter = presenter
        itreator.presenter = presenter
        
        return view
    }
}

extension HomeRouter: HomePresenterToRouterProtocol {
    func moveToDetailViewController(movie: Movie) {
        //createDetail vc and push in nav
        let controller = MovieDetailRouter.createModule(movie: movie)
        self.view?.navigationController?.pushViewController(controller, animated: true)
    }
}
