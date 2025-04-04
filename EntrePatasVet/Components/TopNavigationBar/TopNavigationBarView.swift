//
//  TopNavigationBarView.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 2/03/25.
//

import Foundation
import UIKit

protocol TopNavigationBarViewDelegate: AnyObject {
	func didTapBackButton()
}

@IBDesignable class TopNavigationBarView: UIView {
	
	weak var delegate: TopNavigationBarViewDelegate?
	
	@IBOutlet weak var messageButton: UIButton!
	
	@IBOutlet weak var alertButton: UIButton!
	
	@IBOutlet weak var topBarLabel: UILabel!
	
	@IBOutlet weak var backButton: UIButton!
	
	@IBOutlet var containerView: UIView!
	
	var backAction: () -> Void = {}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupXib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupXib()
	}
	
	func setupXib() {
		Bundle.main.loadNibNamed("TopNavigationBarView", owner: self, options: nil)
		addSubview(containerView)
		containerView.frame = self.bounds
		containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		backButton.isHidden = true
	}
	
	func setupBackButton() {
		backButton.isHidden = false
		backButton
			.addTarget(
				self,
				action: #selector(backButtonTapped),
				for: .touchUpInside
			)
	}
	
	@objc private func backButtonTapped() {
		delegate?.didTapBackButton()
	}
}
