//
//  APIError.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 03/05/2021.
//  
//

import Foundation

enum APIError: Error {
	case holiday_noInternet
	case holiday_forbidden              //Status code 403
	case holiday_notFound               //Status code 404
	case holiday_conflict               //Status code 409
	case holiday_internalServerError    //Status code 500
}

extension APIError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .holiday_noInternet:
			return "No Internet connection available"
		default:
			return "Unknown Error Occured"
		}
	}
}
