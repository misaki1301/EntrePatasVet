//
//  OnboardPageViewController.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 22/02/25.
//

import UIKit

class OnboardPageViewController: UIViewController {
	
	@IBOutlet weak var coverImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	
	var titleText: String = ""
	var subtitleText: String = ""
	var imageName: String = ""
	
	override func viewDidLoad() {
		view.backgroundColor = .clear
		titleLabel.text = titleText
		subtitleLabel.text = subtitleText
		coverImageView.image = UIImage(named: imageName)
		setStyles()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		print("OnboardPageViewController")
    }
	
	private func setStyles() {
		titleLabel.font = UIFont(name: "NewSpirit-Medium", size: 28)
		subtitleLabel.font = UIFont(name: "Outfit-Medium", size: 18)
		titleLabel.textColor = .white
		subtitleLabel.textColor = .white
	}

}
