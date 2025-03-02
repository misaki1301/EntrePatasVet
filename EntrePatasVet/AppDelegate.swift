//
//  AppDelegate.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 19/02/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


	var window: UIWindow?
	var appCoordinator: AppCoordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		self.window = UIWindow(frame: UIScreen.main.bounds)
		guard let window = window else {
			return true
		}
		
		appCoordinator = AppCoordinator(window: window)
		appCoordinator?.start()
		
		return true
	}

}

