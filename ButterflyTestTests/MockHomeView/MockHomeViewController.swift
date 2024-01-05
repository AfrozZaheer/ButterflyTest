//
//  MockHomeViewController.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import UIKit
@testable import ButterflyTest

class MockHomeViewController: UIViewController, HomePresenterToViewProtocol {
    var presenter: ButterflyTest.HomeViewToPresenterProtocol?

    var showedError = false
    var fetchedResult = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchedResults(movies: [ButterflyTest.HomeMovieModel]) {
        fetchedResult = true
    }
    
    func showError(error: Error) {
        showedError = true
    }    
}
