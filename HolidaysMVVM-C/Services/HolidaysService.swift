//
//  HolidaysService.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import Foundation

class HolidaysService {
    
    static let shared = { HolidaysService() }()
    
    func getHolidays(country: String, success: @escaping (Int, Holidays) -> (), failure: @escaping (String) -> ()) {
        
        typealias Parameters = [String : Any]
        
        let parameters: Parameters = ["country": country,
                                      "year": "2019"]
        
        APIClient.shared.get(urlString: API_GET_HOLIDAYS, parameters: parameters, success: { (code, holidays) in
            success(code, holidays)
        }) { (error) in
            failure(error)
        }
    }
}
