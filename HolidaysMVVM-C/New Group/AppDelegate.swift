//
//  AppDelegate.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//  
//

import UIKit
import RxSwift
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	private var appCoordinator: AppCoordinator!
	private let disposeBag = DisposeBag()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow()
		
		NetworkActivityLogger.shared.startLogging()
		NetworkActivityLogger.shared.level = .debug
		
		appCoordinator = AppCoordinator(window: window!)
		appCoordinator.start()
			.subscribe()
			.disposed(by: disposeBag)
		
		return true
	}

}

