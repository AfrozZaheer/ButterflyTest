//
//  HomeItreator.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation
import Alamofire
import Cache

class HomeIntreactor: HomePresenterToItreatorProtocol {
    
    var apiManager: MovieApiManagerProtocol
    weak var presenter: HomeIntreactorToPresenterProtocol?
    
    init(apiManager: MovieApiManagerProtocol) {
        self.apiManager = apiManager
    }
    
    private func getDataFromCacheManager(url: String) {
        OfflineNetwork.shared.getListItemFromCache(key: url) { (movies: [Movie]?) in
            let pagination = Pagination(currentPage: 1) // specifically pass 1 so we can not call more pagination.
            guard let movies else {return}
            self.presenter?.didFetched(movies: movies, paginationData: pagination)
        }
    }
    
    func fetchMovies(txt: String?, page: Int) {
        
        if let rm = NetworkReachabilityManager(), !rm.isReachable {
            //fetch from cache
            getDataFromCacheManager(url: MyEndPoint.nowPlayingMovies.urlString())
            return
        }
        
        if let textToSearch = txt, !textToSearch.isEmpty {
            //call search api
            let param: [String : Any] = ["query":textToSearch,
                         "page":page,
                         "include_adult":false]
            
            apiManager.searchMovie(params: param) {[weak self] fetchedData in
                guard let self else {return}
                guard let fetchedData else {return}
                guard let movies = fetchedData.results else {return}
                let pagination = Pagination(totalPages: fetchedData.totalPages ?? 1, currentPage: fetchedData.page ?? 1, totalItems: fetchedData.totalResults ?? 0)
                
                self.presenter?.didFetched(movies: movies, paginationData: pagination)

            } failure: {[weak self] error in
                guard let self else {return}
                self.presenter?.errorOccurecd(error: error)
            }

            
        } else {
            //call trending all movies api
            apiManager.getMovies(params: ["page": page]) {[weak self] fetchedData in
                
                guard let self else {return}
                guard let fetchedData else {return}
                guard let movies = fetchedData.results else {return}
                let pagination = Pagination(totalPages: fetchedData.totalPages ?? 1, currentPage: fetchedData.page ?? 1, totalItems: fetchedData.totalResults ?? 0)
                
                self.presenter?.didFetched(movies: movies, paginationData: pagination)
                
            } failure: {[weak self] error in
                guard let self else {return}
                self.presenter?.errorOccurecd(error: error)
            }
        }
    }
}

