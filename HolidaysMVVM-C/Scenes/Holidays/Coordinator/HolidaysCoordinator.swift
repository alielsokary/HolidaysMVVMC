//
//  HolidaysCoordinator.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import RxSwift
import ReactiveCoordinator

class HolidaysCoordinator: ReactiveCoordinator<Void> {
	
	let rootViewController: UIViewController
	
	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}
}
