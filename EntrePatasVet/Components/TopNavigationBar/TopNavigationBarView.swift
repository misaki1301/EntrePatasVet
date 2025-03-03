//
//  TopNavigationBarView.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 2/03/25.
//

import Foundation
import UIKit

@IBDesignable class TopNavigationBarView: UIView {
	
	@IBOutlet weak var messageButton: UIButton!
	
	@IBOutlet weak var alertButton: UIButton!
	
	@IBOutlet weak var topBarLabel: UILabel!
	
	
	func setupTitle(title: String) {
		topBarLabel.text = title
	}
	
	var nibName:String = "TopNavigationBarView"
	
}
