//
//  MyEndPoint.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 29/12/2023.
//

import Foundation

let myNetworkManager = MyNetworkManager.shared

class MyNetworkManager: APIRoutable {

    var sessionManager: APISessionManager = APISessionManager()
    static let shared = MyNetworkManager()
    private init() {}
    
    
    func getHeaders(_ authorized: Bool, _ additionalHeaders: [String : String]?) -> [String : String]? {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        if authorized {
            headers["Authorization"] = "Bearer \(Constants.PrivateKeys.TMDBApiReadAccessToken.rawValue)"
        }

        if let addtionalHeaderFields = additionalHeaders {
            addtionalHeaderFields.forEach { (key, value) in
                headers[key] = value
            }
        }
        return headers
    }
    
    
}
