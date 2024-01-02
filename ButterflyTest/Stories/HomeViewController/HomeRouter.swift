//
//  HomeRouter.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation
import UIKit

class HomeRouter {
    
    static func createModule() -> HomeViewController {
        let view = HomeViewController.initializeViewControllerInstance()
        let itreator = HomeItreator(apiManager: MovieApiManager())
        let router = HomeRouter()
        
        let presenter = HomePresenter(view: view, itreator: itreator, router: router)
        
        view.presenter = presenter
        itreator.presenter = presenter
        
        return view
    }
}

extension HomeRouter: HomePresenterToRouterProtocol {
    func moveToDetailViewController(nav: UINavigationController, movie: Movie) {
        //push to new module
    }
}
