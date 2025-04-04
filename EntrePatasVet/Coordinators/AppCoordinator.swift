//
//  AppCoordinator.swift
//  EntrePatasVet
//
//  Created by Paul Pacheco on 2/03/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] {get set}
	var navigationController: UINavigationController {get set}
	func start()
	func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
	func childDidFinish(_ child: Coordinator?) {
		if let child = child, let index = childCoordinators.firstIndex(where: {$0 === child}) {
			childCoordinators.remove(at: index)
		}
	}
}

class AppCoordinator: Coordinator {
	var window: UIWindow
	var childCoordinators: [any Coordinator] = []
	var navigationController: UINavigationController
	
	init(window: UIWindow) {
		self.window = window
		self.navigationController = UINavigationController()
	}
	
	func start() {
		showMainFlow()
	}
	
	func showMainFlow() {
		let mainCoordinator = MainCoordinator(navigationController: navigationController)
		childCoordinators.append(mainCoordinator)
		mainCoordinator.parentCoordinator = self
		mainCoordinator.start()
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		
	}
}

class MainCoordinator: Coordinator {
	var childCoordinators: [any Coordinator] = []
	var navigationController: UINavigationController
	weak var parentCoordinator: AppCoordinator?
	
	init(
		navigationController: UINavigationController,
		parentCoordinator: AppCoordinator? = nil) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
	}
	
	func start() {
		guard let homeVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(withIdentifier: "OnboardingViewController")
				as? OnboardingViewController else {
			return
		}
		homeVC.coordinator = self
		navigationController.pushViewController(homeVC, animated: true)
	}
	
	func showHome() {
		//let homeCoordinator = HomeCoordinator(navigationController: navigationController)
		let homeCoordinator = TabNavigationCoordinator()
		childCoordinators.append(homeCoordinator)
		homeCoordinator.parentCoordinator = self
		// Set the TabBarController as the root of the window
		homeCoordinator.start()
		if let window = UIApplication.shared.windows.first {
			window.rootViewController = homeCoordinator.tabController
			window.makeKeyAndVisible()
		}
		
	}
}

class GetCareCoordinator: Coordinator {
	var childCoordinators: [any Coordinator]

	var navigationController: UINavigationController
	
	init(
		childCoordinators: [any Coordinator],
		navigationController: UINavigationController
	) {
		self.childCoordinators = childCoordinators
		self.navigationController = navigationController
	}

	func start() {
		guard let getCareVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(
				withIdentifier: "GetCareViewController"
			) as? GetCareViewController
		else { return }
		
		navigationController.viewControllers = [getCareVC]
	}

	
}

class HomeCoordinator: Coordinator {
	var childCoordinators: [any Coordinator] = []
	var navigationController: UINavigationController
	weak var parentCoordiantor: Coordinator?
	
	init(
		navigationController: UINavigationController,
		parentCoordiantor: AppCoordinator? = nil) {
		self.navigationController = navigationController
		self.parentCoordiantor = parentCoordiantor
	}
	
	func start() {
		guard let homeVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(withIdentifier: "HomeViewController")
				as? HomeViewController else { return }
		print("Home")
		navigationController.viewControllers = [homeVC]
	}
}
