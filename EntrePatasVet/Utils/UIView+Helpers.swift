//
//  UIView+Helpers.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 22/03/25.
//

import Foundation
import UIKit

extension UIView {
	static func loadFromNib<T: UIView>() -> T {
		let nibName = String(describing: self)
		return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! T
	}
}
