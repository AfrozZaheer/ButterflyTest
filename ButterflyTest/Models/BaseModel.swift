//
//  BaseModel.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import Foundation
import ObjectMapper

class BaseModel<T: Mappable>: NSObject, Mappable {
    
    var page: Int?
    var results: [T]?
    var totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        page <- map[CodingKeys.page.rawValue]
        results <- map[CodingKeys.results.rawValue]
        totalPages <- map[CodingKeys.totalPages.rawValue]
        totalResults <- map[CodingKeys.totalResults.rawValue]
    }
}
