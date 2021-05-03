//
//  UserRouter.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 02/05/2021.
//  
//

import Alamofire

enum HolidaysRouter: URLRequestBuilder {

	case getCountries
	case getHolidays(country: String)

	// MARK: - Path
	internal var path: ServerPaths {
		switch self {
		case .getCountries:
			return .countries
		case .getHolidays:
			return .holidays
		}
	}

	// MARK: - Parameters
	internal var parameters: Parameters? {
		var params = defaultParams
		switch self {
		case .getCountries:
			return params
		case .getHolidays(let country):
			params["country"] = country
		return params
		}
	}

	// MARK: - Methods
	internal var method: HTTPMethod {
		return .get
	}
}
