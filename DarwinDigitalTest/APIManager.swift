//
//  APIManager.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import Alamofire

final class APIManager {
    enum ErrorResponse: Error {
        case invalidData
        case invalidModel
    }
    
    static let shared = APIManager()
    typealias UserCallback = ([User]?, ErrorResponse?) -> Void
    
    private init() {
    }
    
    /// Use this method to get list of users.
    ///
    /// - Parameter completion: completion block with 2 parameters: list of users if request was success or error response if request failed.
    func getUsers(completion:@escaping (UserCallback)) {
        Alamofire.request("https://demo7242924.mockable.io/getUserDetails").responseJSON { response in
            if let data = response.data {
                let jsonDecoder = JSONDecoder()
                if let users = try? jsonDecoder.decode([User].self, from: data) {
                    completion(users, nil)
                }
                completion(nil, .invalidModel)
            }
            
            completion(nil, .invalidData)
        }
    }
}
