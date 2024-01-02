//
//  Pagination.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 03/01/2024.
//

import Foundation

class Pagination {
    
    var totalPages: Int = 0
    var currentPage: Int = 0
    var totalItems: Int = 0
    
    init(totalPages: Int = 1, currentPage: Int = 0, totalItems: Int = 0) {
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.totalItems = totalItems
    }
    
    func shouldFetchNext() -> Bool {
        if currentPage == 0 {return true} // case to handle first fetch
        return currentPage < totalPages
    }
    
}
