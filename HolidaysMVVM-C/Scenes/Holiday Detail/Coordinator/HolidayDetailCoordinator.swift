//
//  HolidayDetailCoordinator.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 24/04/2021.
//  
//

import RxSwift

class HolidayDetailCoordinator: BaseCoordinator<Void> {
	
	private let rootViewController: UIViewController
	public var viewModel: HolidayViewModel!
	
	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}
	
	override func start() -> Observable<Void> {
		let viewController = HolidayDetailViewController()
		viewController.viewModel = viewModel
		
		let didClose = viewModel.didClose
		
		rootViewController.navigationController?.pushViewController(viewController, animated: true)
		
		return didClose
			.take(1)
	}
}
