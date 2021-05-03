//
//  ChooseCountryViewModel.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import RxSwift
import RxCocoa

final class ChooseCountryViewModel {
	private let disposeBag = DisposeBag()
	
	//MARK: - Actions
	let didClose = PublishSubject<Void>()
	let selectedCountry = PublishSubject<String>()
	
	let isLoading = BehaviorSubject<Bool>(value: false)
	let searchText = PublishSubject<String>()
	
	// MARK: - Table View Model & Data Source
	let fetchedCountries = BehaviorSubject<[CountryViewModel]>(value: [])
	let filteredCountries = BehaviorSubject<[CountryViewModel]>(value: [])
	
	let service: CountriesService
	
	init(service: CountriesService) {
		self.service = service
	}
	
	// MARK: - API Call
	func fetchCountries() {
		self.isLoading.onNext(true)
		service.getCountries()
			.subscribe { [weak self] countries in
				self?.isLoading.onNext(false)
				let countryItems = countries.element?.countries?.compactMap {
					CountryViewModel(country: $0)
				}
				self?.fetchedCountries.onNext(countryItems ?? [])
				self?.filteredCountries.onNext(countryItems ?? [])

				self?.bindSearchToModel()
			}.disposed(by: disposeBag)
	}
	
	func bindSearchToModel() {
		self.searchText.subscribe(onNext: { [weak self] (text) in
			guard let `self` = self else { return }
			
			switch text.isEmpty {
			case false:
				let countries = try! self.fetchedCountries.value().filter {
					$0.name.range(of: text, options: .caseInsensitive) != nil
				}
				self.filteredCountries.onNext(countries)
			case true:
				self.filteredCountries.onNext(try! self.fetchedCountries.value())
			}
		   
		})
			.disposed(by: disposeBag)
		
	}

}
