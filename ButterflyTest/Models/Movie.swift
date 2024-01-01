//
//  Movie.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import Foundation
import ObjectMapper

class Movie: NSObject, Mappable {
    
    var name = ""
    var alpha2Code = ""
    var alpha3Code = ""
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        name <- map["name"]
        alpha2Code <- map["alpha2Code"]
        alpha3Code <- map["alpha3Code"]
    }
}
