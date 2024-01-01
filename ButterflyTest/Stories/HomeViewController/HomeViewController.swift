//
//  HomeViewController.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    static func initializeViewControllerInstance() -> HomeViewController {
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
