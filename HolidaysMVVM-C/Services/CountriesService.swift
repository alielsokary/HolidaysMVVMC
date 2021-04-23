//
//  CountriesService.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import Foundation

class CountriesService {
    
    static let shared = { CountriesService() }()
    
    func getCountries(success: @escaping (Int, Countries) -> (), failure: @escaping (String) -> ()) {
        
        APIClient.shared.get(urlString: API_GET_COUNTRIES, success: { (code, countries) in
            success(code, countries)
        }) { (error) in
            failure(error)
        }
    }
}
