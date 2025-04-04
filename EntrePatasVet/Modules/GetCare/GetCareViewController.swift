//
//  GetCareViewController.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 6/03/25.
//

import UIKit

class GetCareViewController: UIViewController {
	
	@IBOutlet weak var optionsContainerView: UIView!
	
	@IBOutlet weak var optionsCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
			// Do any additional setup after loading the view.
		optionsContainerView.layer.cornerRadius = 16
		optionsContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		
		optionsCollectionView.delegate = self
		optionsCollectionView.dataSource = self
		
		optionsCollectionView.collectionViewLayout = createTwoColumnLayout()
		optionsCollectionView.isScrollEnabled = false
		optionsCollectionView.heightAnchor
			.constraint(
				equalToConstant: calculateCompositionalLayoutHeight()
			).isActive = true
		optionsCollectionView.backgroundColor = .white
	}
	
	private func createTwoColumnLayout() -> UICollectionViewLayout {
		let itemSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .fractionalHeight(1.0)
		)
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .absolute(200)
		)
		let group = NSCollectionLayoutGroup.horizontal(
			layoutSize: groupSize,
			subitem: item,
			count: 2
		)
		group.interItemSpacing = .fixed(16)
		
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 16
		section.contentInsets = NSDirectionalEdgeInsets(
			top: 0,
			leading: 0,
			bottom: 0,
			trailing: 0
		)
		
		return UICollectionViewCompositionalLayout(section: section)
	}
	
	private func calculateCompositionalLayoutHeight() -> CGFloat {
		//let snapshot = dataSource.snapshot()
		let groupsCount = ceil(6 / 2.0)
		return groupsCount * 200 // Adjust based on your group height
	}

}

extension GetCareViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		6
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: "OptionMenuCell",
			for: indexPath
		)
		return cell
	}

	
}


