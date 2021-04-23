//
//  CountryViewModel.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import RxSwift
import RxCocoa

struct CountryViewModel {
	let code: String
	let name: String
	
	init(country: Country) {
		self.code = country.code!
		self.name = country.name!
	}
}
