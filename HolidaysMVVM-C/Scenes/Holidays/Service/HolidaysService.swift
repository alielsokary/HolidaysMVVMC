//
//  HolidaysService.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 02/05/2021.
//  
//

import RxSwift

protocol HolidaysService {
	func getHolidays(country: String) -> Observable<Holidays>
}

class HolidaysServiceImpl: APIClient, HolidaysService {
	func getHolidays(country: String) -> Observable<Holidays> {
		return request(.getHolidays(country: country))
	}
}
