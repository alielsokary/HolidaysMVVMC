//
//  APIManager.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
  
    lazy var baseURL: String = {
        return "https://holidayapi.com/v1/"
    }()
    
    lazy var apiKey: String = {
        return "668257df-4851-4b2c-82b8-f423a5a528d6"
    }()
    
}
