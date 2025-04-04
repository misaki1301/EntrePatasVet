//
//  OnboardingViewController.swift
//  EntrePatasVet
//
//  Created by Paul Frank on 20/02/25.
//

import UIKit

class OnboardingViewController: UIPageViewController {
	
	weak var coordinator: MainCoordinator?
	var pages = [UIViewController]()
	var bottomButton: NSLayoutConstraint?
	var pageControl = UIPageControl()
	var currentIndex = 0 {
		didSet {
			pageControl.currentPage = currentIndex
			print(currentIndex)
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		makeView()
		setBackgroundColor()
		setupSkipButton()
		setupGetStartedButton()
		makeControll()
		setupLogo()
    }
	
	private func setupPage(title: String = "", subtitle: String = "", imageName: String = "") -> UIViewController {
		let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
			withIdentifier: "OnboardPageViewController"
		)
		guard let pageController = controller as? OnboardPageViewController else {
			return UIViewController()
		}
		pageController.imageName = imageName
		pageController.titleText = title
		pageController.subtitleText = subtitle
		return pageController
	}
	
	private func setupLogo() {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 8
		stackView.distribution = .equalCentering
		stackView.alignment = .center
		let label = UILabel()
		label.text = "Entre patas"
		label.textColor = .white
		label.font = UIFont(name: "Outfit-Medium", size: 16)
		let logo = UIImage(named: "entre_patas")
		let logoImageView = UIImageView(image: logo!)
		// Use addArrangedSubview instead of addSubview
	   stackView.addArrangedSubview(logoImageView)
	   stackView.addArrangedSubview(label)
		view.addSubview(stackView)
		label.translatesAutoresizingMaskIntoConstraints = false
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			logoImageView.heightAnchor.constraint(equalToConstant: 32),
			logoImageView.widthAnchor.constraint(equalToConstant: 32),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
		])
	}
	
	private func setupSkipButton() {
		let skipButton = UIButton()
		skipButton.setTitle("Sign in", for: .normal)
		skipButton.setTitleColor(.black, for: .normal)
		skipButton.addTarget(self, action: #selector(skip), for: .touchUpInside)
		skipButton.translatesAutoresizingMaskIntoConstraints = false
		skipButton.addCornerRadius(borderWidth: 0.75)
		skipButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
		// change text color to white
		skipButton.setTitleColor(.white, for: .normal)
		skipButton.titleLabel?.font = UIFont(name: "Outfit-Medium", size: 16)
		view.addSubview(skipButton)
		NSLayoutConstraint.activate([
			skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}
	
	func makeControll() {
			self.view.addSubview(pageControl)
			
			pageControl.translatesAutoresizingMaskIntoConstraints = false
			pageControl.currentPageIndicatorTintColor = .black
			pageControl.pageIndicatorTintColor = .lightGray
			pageControl.numberOfPages = pages.count
			pageControl.currentPage = currentIndex
			
			pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -120).isActive = true
			pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
			
			//pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
		}
	
	private func setupGetStartedButton() {
		let getStartedButton = UIButton()
		getStartedButton.setTitle("Get Started", for: .normal)
		getStartedButton.setTitleColor(.black, for: .normal)
		//add borders with corner radius
		getStartedButton.addCornerRadius(borderColor: .black, borderWidth: 0.25)
		//change button background color
		getStartedButton.backgroundColor = .timberwolf
		//add icon arrow left to button
		getStartedButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
		getStartedButton.tintColor = .black
		getStartedButton.semanticContentAttribute = .forceRightToLeft
		getStartedButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16 - UIScreen.main.bounds.width/2)
		//add target
		getStartedButton.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
		getStartedButton.translatesAutoresizingMaskIntoConstraints = false
		getStartedButton.titleLabel?.font = UIFont(name: "Outfit-Medium", size: 16)
		view.addSubview(getStartedButton)
		NSLayoutConstraint.activate([
			getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
			getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			getStartedButton.heightAnchor.constraint(equalToConstant: 50),
			getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}
	
	private func setBackgroundColor() {
		//use color midnight saved in assets
		view.backgroundColor = .midnightEagle
	}
	
	@objc private func getStarted() {
		print("Get Started")
		coordinator?.showHome()
		
	}
	
	@objc private func skip() {
		print("Skip")
	}
	
	func makeView() {
		pages = [
			setupPage(title: "Amazing Care",subtitle: "Next level veterinary care, incluiding a decidated pet parent concierge team", imageName: "onboarding_1"),
			setupPage(title: "All in one", subtitle: "Routine and emergency veterinary care, under one roof", imageName: "onboarding_3"),
			setupPage(title: "Easy booking", subtitle: "Some- or next-day appointments Open 10am-10pm Every. Single. Day.", imageName: "onboarding_2"),
		]
		setViewControllers(
			[pages.first!],
			direction: .forward,
			animated: true,
			completion: nil
		)
		self.dataSource = self
		self.delegate = self
	}

}

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
		self.currentIndex = currentIndex
		if currentIndex == 0 {
			return pages.last
		}
		return pages[currentIndex - 1]
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
		self.currentIndex = currentIndex
		if currentIndex == pages.count - 1 {
			return pages.first
		}
		return pages[currentIndex + 1]
	}
}
//add extension to add cornerradius to button
extension UIButton {
	func addCornerRadius(borderColor: UIColor = .white, borderWidth: CGFloat = 2, cornerRadius: CGFloat = 16) {
		layer.cornerRadius = cornerRadius
		layer.borderWidth = borderWidth
		layer.borderColor = borderColor.cgColor
		
	}
}

