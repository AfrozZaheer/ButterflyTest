//
//  MovieApiManager.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation


protocol MovieApiManagerProtocol {
    func getMovies(completion: @escaping (_ movies: [Movie]?) -> Void, failure: @escaping (_ error: Error) -> Void)
}

class MovieApiManager: MovieApiManagerProtocol {
    
    func getMovies(completion: @escaping (_ movies: [Movie]?) -> Void, failure: @escaping (_ error: Error) -> Void) {
        
        let api = API(method: .get, endPoint: MyEndPoint.nowPlayingMovies, isAuthorized: true, parameters: nil)
        
        myNetworkManager.requestObject(api, mapperType: BaseModel<Movie>.self) { result in
            switch result {
            case .success(let value):
                completion(value.results)
                break

            case .failure(let error):
                failure(error)
                break

            }
        }
    }
}
