//
//  MockApiManager.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import Foundation
@testable import ButterflyTest

class MockApiManager: MovieApiManagerProtocol {
    var shouldFail = false
    func getMovies(params: [String : Any]?, completion: @escaping (ButterflyTest.BaseModel<ButterflyTest.Movie>?) -> Void, failure: @escaping (Error) -> Void) {
        if shouldFail {
            failure(NSError(errorMessage: "MockError"))

        } else {
            completion(BaseModel<Movie>(JSONString: ""))
        }
    }
    
    func searchMovie(params: [String : Any]?, completion: @escaping (ButterflyTest.BaseModel<ButterflyTest.Movie>?) -> Void, failure: @escaping (Error) -> Void) {
        if shouldFail {
            failure(NSError(errorMessage: "MockError"))
        } else {
            completion(BaseModel<Movie>(JSONString: ""))
        }
    }
    
    func getMovieDetails(id: Int, completion: @escaping (ButterflyTest.Movie?) -> Void, failure: @escaping (Error) -> Void) {
        // Not testing this scenario :D 
    }
    
    
}

