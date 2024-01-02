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
        let controller = HomeRouter.createModule()
        
        let nav = UINavigationController(rootViewController: controller)
        window.rootViewController = nav
        self.window = window
    }
    
}
