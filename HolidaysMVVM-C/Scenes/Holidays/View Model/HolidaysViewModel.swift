//
//  HolidaysViewModel.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import RxSwift
import RxCocoa

class HolidaysViewModel {
    private let disposeBag = DisposeBag()
    
	//MARK:- Actions
	let isLoading = BehaviorSubject<Bool>(value: false)
	let selectedCountry = PublishSubject<String>()
	let selectedHoliday = PublishSubject<HolidayViewModel>()
	let chooseCountry = PublishSubject<Void>()
	
	var holidays = BehaviorSubject<[HolidayViewModel]>(
		value: []
	)
	
	let service: HolidaysService
	
	init(service: HolidaysService) {
		self.service = service
	}
	
	// MARK: - API Call
	func fetchHolidays() {
		self.selectedCountry.subscribe { [weak self] (country) in
			guard let `self` = self else { return }
			self.isLoading.onNext(true)
			self.service.getHolidays(country: country.element ?? "")
				.subscribe { holidays in
					self.isLoading.onNext(false)
					let holidayItems = holidays.element?.holidays?.compactMap { HolidayViewModel(holiday: $0)
				}
					self.holidays.onNext(holidayItems ?? [])
				}.disposed(by: self.disposeBag)

		}.disposed(by: disposeBag)

//		self.selectedCountry
//			.subscribe(onNext: { [weak self] (country) in
//				guard let `self` = self else { return }
//
//				self.isLoading.onNext(true)
//				HolidaysService.shared.getHolidays(country: country, success: { (code, holidays) in
//					self.isLoading.onNext(false)
//

//
//				}) { (error) in
//					self.isLoading.onNext(false)
//					onError(error)
//				}
//			})
//			.disposed(by: disposeBag)
		
	}

    
}
