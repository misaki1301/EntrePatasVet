//
//  HomeTabBarCoordinator.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 22/03/25.
//

import Foundation
import UIKit

class TabNavigationCoordinator: Coordinator {
	var childCoordinators: [any Coordinator] = []
	var navigationController: UINavigationController
	var tabController: UITabBarController
	weak var parentCoordinator: Coordinator?
		//var coordinators: []
	
	init(parentCoordinator: Coordinator? = nil) {
		self.navigationController = UINavigationController()
		self.tabController = UITabBarController()
	}
	
	func start() {
		guard let homeTabViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "HomeViewController"
		) as? HomeViewController else { return }
		
		guard let getCareVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "GetCareViewController"
		) as? GetCareViewController else { return }
		
		guard let carePlanVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "CarePlanViewController"
		) as? CarePlanViewController else { return }
		
		guard let healthRecordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "HealthRecordViewController"
		) as? HealthRecordViewController else { return }
		
		guard let accountVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "AccountViewController"
		) as? AccountViewController else { return }
		
		homeTabViewController.coordinator = self
		
		getCareVC.tabBarItem = UITabBarItem(
			title: "Get Care",
			image: UIImage(systemName: "house.fill"),
			tag: 0
		)
		carePlanVC.tabBarItem = UITabBarItem(
			title: "Care Plan",
			image: UIImage(systemName: "book.closed.fill"),
			tag: 1
		)
		healthRecordVC.tabBarItem = UITabBarItem(
			title: "Health Record",
			image: UIImage(systemName: "clipboard.fill"),
			tag: 2
		)
		accountVC.tabBarItem = UITabBarItem(
			title: "Account",
			image: UIImage(systemName: "person.fill"),
			tag: 3
		)
		
		tabController.tabBar.tintColor = .midnightEagle
		tabController.tabBar.unselectedItemTintColor = .midnightEagleNormal
		
		
		tabController.viewControllers = [
			getCareVC,
			carePlanVC,
			healthRecordVC,
			accountVC
		]
		tabController.tabBar.backgroundColor = .white
	}
	
	func customizeTabBarAppearance() {
		let appearance = UITabBarAppearance()
		
			// Set the tint color for the tab bar items (selected state)
		appearance.stackedLayoutAppearance.selected.iconColor = .midnightEagle
		appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
			.foregroundColor: UIColor.systemBlue
		]
		
			// Set the tint color for the tab bar items (normal state)
		appearance.stackedLayoutAppearance.normal.iconColor = .midnightEagleNormal
		appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
			.foregroundColor: UIColor.gray
		]
		
			// Apply the appearance to the tab bar
		tabController.tabBar.standardAppearance = appearance
		if #available(iOS 15.0, *) {
			tabController.tabBar.scrollEdgeAppearance = appearance
		}
	}
}
