//
//  HomeViewController.swift
//  EntrePatasVet
//
//  Created by Paul Pacheco on 2/03/25.
//

import UIKit

class HomeViewController: UIViewController {
	
	var coordinator: TabNavigationCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		//let view = TopNavigationBarView.instantiate(message: "pac")
		self.navigationController?.isNavigationBarHidden = true
		print(coordinator?.childCoordinators.count)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
