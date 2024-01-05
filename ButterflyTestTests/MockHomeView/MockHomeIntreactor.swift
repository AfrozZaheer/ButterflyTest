//
//  MockHomeIntreactor.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import Foundation
@testable import ButterflyTest

class MockHomeIntreactor: HomePresenterToItreatorProtocol {
    
    var functionCalled = false
    
    var apiManager: ButterflyTest.MovieApiManagerProtocol
    weak var presenter: HomeIntreactorToPresenterProtocol?
    
    init(apiManager: MovieApiManagerProtocol) {
        self.apiManager = apiManager
    }

    
    func fetchMovies(txt: String?, page: Int) {
        functionCalled = true
    }
}
