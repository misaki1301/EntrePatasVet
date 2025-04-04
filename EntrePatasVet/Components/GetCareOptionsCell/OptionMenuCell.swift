//
//  OptionMenuCell.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 29/03/25.
//

import Foundation
import UIKit

@IBDesignable class OptionMenuCell: UICollectionViewCell {
	
	@IBOutlet var containerView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var imageIconView: UIImageView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupXib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupXib()
	}
	
	func setupXib() {
		Bundle.main.loadNibNamed("OptionMenuCell", owner: self, options: nil)
		addSubview(containerView)
		containerView.frame = self.bounds
		containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}
	
	func setupCell(for model: OptionMenu) {
		self.containerView.layer.cornerRadius = 16
		self.titleLabel.text = model.name
		self.descriptionLabel.text = model.description
		self.imageIconView.image = UIImage(systemName: "\(model.image)")
	}
}
