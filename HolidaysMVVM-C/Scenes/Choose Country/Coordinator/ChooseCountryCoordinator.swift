//
//  ChooseCountryCoordinator.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import RxSwift

enum ChooseCountryCoordinationResult {
	case country(String)
	case cancel
}

class ChooseCountryCoordinator: BaseCoordinator<ChooseCountryCoordinationResult> {
	
	let rootViewController: UIViewController
	let service = CountriesServiceImpl()
	
	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}
	
	override func start() -> Observable<CoordinationResult> {
		let viewController =  ChooseCountryViewController()
		
		let navigationController = UINavigationController(rootViewController: viewController)
		
		let viewModel = ChooseCountryViewModel(service: service)
		viewController.viewModel = viewModel
		let country = viewModel.selectedCountry.map { CoordinationResult.country($0)}
		let cancel = viewModel.didClose.map { _ in
			CoordinationResult.cancel
		}
		
		rootViewController.present(navigationController, animated: true, completion: nil)
		
		return Observable.merge(country, cancel).take(1).do(onNext: { _ in
			viewController.dismiss(animated: true, completion: nil)
		})
		
		
	}
}
