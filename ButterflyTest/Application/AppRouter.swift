//
//  AppRouter.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 29/12/2023.
//

import Foundation
import UIKit

class AppRouter {
    var window: UIWindow?
    
    init(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)

        let mainVC = UIStoryboard.main.instantiateViewController(identifier: Constants.ViewControllerIdentifiers.mainVC.rawValue)
        
        let nav = UINavigationController(rootViewController: mainVC)
        window.rootViewController = nav
        self.window = window
    }
    
}
