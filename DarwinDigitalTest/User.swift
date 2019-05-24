//
//  User.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation

class User: Codable {
    class Geo: Codable {
        let lat: String
        let lng: String
    }
    
    class Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        
    }
    
    class Company: Codable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
    
    let id: Int
    let name: String
    let username: String
    let address: Address
    let avatar: String
    let phone: String
    let website: String
    let company: Company
}
