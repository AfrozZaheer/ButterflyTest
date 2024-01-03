//
//  MyEndPoint.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 29/12/2023.
//

import Foundation
import Alamofire

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
    
    func validate(dataResponse: DataResponse<Any>, with completion: @escaping API.Completion<Any?>.simple) {
        if let error = dataResponse.error {
            let errorMessage = errorMessageFromAPIError(error: error)
            if !errorMessage.isEmpty {
                completion(.failure(NSError(errorMessage: errorMessage, code: dataResponse.response?.statusCode)))
                return
            }
        }
        guard let value = dataResponse.value else {
            let message = API.shouldShowDevLogs ? "Response Value from server is nil." : APIErrorMessage.internalServerError
            return completion(.failure(NSError(errorMessage: message, code: APIErrorCodes.responseNil)))
            
        }
        
        if let dic = value as? [String: Any], let status = dic["success"] as? Bool, status == false {// TMDB error occured
            if let code = dic["status_code"] as? Int, let msg = dic["status_message"] as? String {
                completion(.failure(TMDbAPIError(statusCode: code, message: msg)))
            }
        }
        
        completion(.success(value))
    }
    
}
