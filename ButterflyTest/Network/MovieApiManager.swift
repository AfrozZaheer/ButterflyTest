//
//  MovieApiManager.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation

class MovieApiManager {
    
    func getMovies(completion: @escaping (_ movies: [Movie]?) -> Void, failure: @escaping (_ error: Error) -> Void) {
        
        let api = API(method: .get, endPoint: MyEndPoint.nowPlayingMovies, isAuthorized: true)
        myNetworkManager.requestList(api, mapperType: Movie.self, parsingLevel: "") { result in
            switch result {
            case .success(let value):
                completion(value)
                break

            case .failure(let error):
                failure(error)
                break

            }
        }
    }
}
