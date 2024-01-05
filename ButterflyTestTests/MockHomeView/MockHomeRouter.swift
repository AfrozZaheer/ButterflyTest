//
//  MockHomeRouter.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import Foundation
import UIKit
@testable import ButterflyTest

class MockHomeRouter: HomePresenterToRouterProtocol {
    var functionCalled = false
    var view: UIViewController?
    
    func moveToDetailViewController(movie: ButterflyTest.Movie) {
        functionCalled = true
    }
    
    
}
