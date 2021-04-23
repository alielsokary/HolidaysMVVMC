//
//  AppCoordinator.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import RxSwift
import ReactiveCoordinator


class AppCoordinator: ReactiveCoordinator<Void> {
	
	var window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	override func start() -> Observable<Void> {
		let navigationController = UINavigationController(rootViewController: HolidaysViewController())
		
		let holidaysCoordinator = HolidaysCoordinator(rootViewController: navigationController.viewControllers[0])
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		
		return coordinate(to: holidaysCoordinator)
	}
}
