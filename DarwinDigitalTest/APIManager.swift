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
    
    /// Use this method to get list of users locally(if there are already saved data) or remote(if data wasn't found in local storage).
    ///
    /// - Parameter completion: completion block with 2 parameters: list of users if request was success or error response if request failed.
    func getUsers(completion:@escaping (UserCallback)) {
        if let data = UserDefaults.standard.value(forKey: "users") as? Data {
            let jsonDecoder = JSONDecoder()
            if let users = try? jsonDecoder.decode([User].self, from: data) {
                completion(users, nil)
            }
        } else {
            Alamofire.request("https://demo7242924.mockable.io/getUserDetails").responseJSON { response in
                if let data = response.data {
                    let jsonDecoder = JSONDecoder()
                    if let users = try? jsonDecoder.decode([User].self, from: data) {
                        #warning("User Defaults are not good way to save data like this, it's better to use CoreData or Realm, but for this purpose User Defaults works :)")
                        UserDefaults.standard.set(data, forKey: "users")
                        completion(users, nil)
                    }
                    completion(nil, .invalidModel)
                }
                
                completion(nil, .invalidData)
            }
        }
    }
}
