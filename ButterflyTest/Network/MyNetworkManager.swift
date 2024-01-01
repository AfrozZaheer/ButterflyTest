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
}
