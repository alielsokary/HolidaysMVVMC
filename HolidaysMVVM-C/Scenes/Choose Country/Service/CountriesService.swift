//
//  CountriesService.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 03/05/2021.
//  
//

import RxSwift

protocol CountriesService {
	func getCountries() -> Observable<Countries>
}

class CountriesServiceImpl: APIClient ,CountriesService {
	func getCountries() -> Observable<Countries> {
		return request(.getCountries)
	}
}
