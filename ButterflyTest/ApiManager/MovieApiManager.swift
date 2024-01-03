//
//  MovieApiManager.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation


protocol MovieApiManagerProtocol {
    func getMovies(params:[String: Any]?, completion: @escaping (_ movies: BaseModel<Movie>?) -> Void, failure: @escaping (_ error: Error) -> Void)
    func searchMovie(params:[String: Any]?, completion: @escaping (_ movies: BaseModel<Movie>?) -> Void, failure: @escaping (_ error: Error) -> Void)
    
    func getMovieDetails(id: Int, completion: @escaping (_ movies: Movie?) -> Void, failure: @escaping (_ error: Error) -> Void)
    
}

class MovieApiManager: MovieApiManagerProtocol {
    func searchMovie(params: [String : Any]?, completion: @escaping (BaseModel<Movie>?) -> Void, failure: @escaping (Error) -> Void) {
        let api = API(method: .get, endPoint: MyEndPoint.searchMovie, isAuthorized: true, parameters: params)
        
        myNetworkManager.requestObject(api, mapperType: BaseModel<Movie>.self) { result in
            switch result {
            case .success(let value):
                completion(value)

            case .failure(let error):
                failure(error)

            }
        }
        
    }
    
    func getMovies(params:[String: Any]?,completion: @escaping (_ movies: BaseModel<Movie>?) -> Void, failure: @escaping (_ error: Error) -> Void) {
        
        let api = API(method: .get, endPoint: MyEndPoint.nowPlayingMovies, isAuthorized: true, parameters: params)
        
        myNetworkManager.requestObject(api, mapperType: BaseModel<Movie>.self) { result in
            switch result {
            case .success(let value):
                completion(value)

            case .failure(let error):
                failure(error)

            }
        }
    }
    
    func getMovieDetails(id: Int, completion: @escaping (Movie?) -> Void, failure: @escaping (Error) -> Void) {
        let api = API(method: .get, endPoint: MyEndPoint.movieDetail(id: id), isAuthorized: true)
        
        myNetworkManager.requestObject(api, mapperType: Movie.self) { result in
            switch result {
            case .success(let value):
                completion(value)
                
            case .failure(let error):
                failure(error)
                
            }
        }
        
    }
    
}
