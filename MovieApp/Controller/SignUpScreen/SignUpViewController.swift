//
//  SignUpViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpDisplayLogic: AnyObject
{
    func displayViewInit(viewModel: SignUpModel.ViewInit.ViewModel)
}

class SignUpViewController: UIViewController
{
    
    // MARK: - Properties
    
    enum Dimen {
        // basic style
        static let defaultMargin: CGFloat = 20
        static let marginLeft: CGFloat = 20
        static let marginRight: CGFloat = 20
        static let marginBottom: CGFloat = 20
        static let marginTop: CGFloat = 20
        
        // middleText
        static let fontSize: CGFloat = 35
        
        // middleSubText
        static let subTextFontSize: CGFloat = 20
        
        // logo
        static let logoWidth: CGFloat = 90
        static let logohHeight: CGFloat = 25
        
        // homeCarouselView page number
        static let pageNumner: Int = 3
    }

    // MARK: - Properties
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton().signUpButton(withText: nil)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var privacyButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handlePrivacy), for: .touchUpInside)
        return button
    }()
    
    private var homeCarouselView: HomeCarouselView?
    
    var interactor: SignUpBusinessLogic?
    var router: (SignUpRoutingLogic & SignUpDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        interactor?.requestViewInit()
        setupHomeCarouselViewUI()
        setupViews()
    }
    
    private func setup() {
        let viewController = self
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Set up views
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(signUpButton)
        view.addSubview(logoImage)
        view.addSubview(signInButton)
        view.addSubview(privacyButton)
        
        signUpButton.anchor(
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingBottom: Dimen.marginBottom,
            paddingLeft: Dimen.marginLeft,
            paddingRight: Dimen.marginRight
        )
        
        logoImage.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            paddingLeft: Dimen.marginLeft,
            width: Dimen.logoWidth, height: Dimen.logohHeight
        )
        
        signInButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            right: view.rightAnchor,
            paddingRight: Dimen.marginRight
        )
        signInButton.centerYAnchor.constraint(
            equalTo: logoImage.centerYAnchor).isActive = true
        
        privacyButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            right: signInButton.leftAnchor,
            paddingRight: Dimen.marginRight
        )
        privacyButton.centerYAnchor.constraint(
            equalTo: logoImage.centerYAnchor).isActive = true
    }
    
    func setupHomeCarouselViewUI() {
        guard let homeCarouselView = homeCarouselView else { return }
        view.addSubview(homeCarouselView)
        homeCarouselView.anchor(
            top: view.topAnchor,
            bottom: view.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor
        )
    }
    
    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handle button actions
    @objc func handleSignUp() {
        
    }
    
    @objc func handleSignIn() {
        router?.routeToSignIn()
    }
    
    @objc func handlePrivacy() {
        router?.routeToPrivacy()
    }
}

// MARK: - SignUpDisplayLogic

extension SignUpViewController: SignUpDisplayLogic {
    func displayViewInit(viewModel: SignUpModel.ViewInit.ViewModel) {
        logoImage.image = viewModel.logoImage
        signUpButton.setTitle(viewModel.signUpButtonTitle, for: .normal)
        signInButton.setTitle(viewModel.signInButtonTitle, for: .normal)
        privacyButton.setTitle(viewModel.privacyButtonTitle, for: .normal)
        homeCarouselView = HomeCarouselView(pages: viewModel.homeCarouselpageNumber)
        homeCarouselView?.configureView(with: viewModel.carouselViewData)
    }
}
