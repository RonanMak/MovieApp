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
    private lazy var logo = UIButton()
    private lazy var homeCarouselView = HomeCarouselView()

    private lazy var signUpButton: UIButton = {
        let button = UIButton().signUpButton(withText: nil)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    var interactor: SignUpBusinessLogic?
    var router: (SignUpRoutingLogic & SignUpDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
        setUpNavigationBar()
        interactor?.requestViewInit()
    }
    
    // MARK: - Set up views
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        setupHomeCarouselViewUI()
        view.addSubview(homeCarouselView)
        homeCarouselView.anchor(
            top: view.topAnchor,
            bottom: view.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor
        )
        view.addSubview(signUpButton)

        signUpButton.anchor(
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingBottom: 20,
            paddingLeft: 20,
            paddingRight: 20
        )
    }

    private func setUpNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        //  item color
        navigationController?.navigationBar.tintColor = .white

        let navigationBarAppearance = UINavigationBarAppearance()
        // background color
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .black
        // title color
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
    }
    
    func setupHomeCarouselViewUI() {

    }
    
    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handle button actions
    @objc func handleSignUp() {
        self.dismiss(animated: true)
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

        homeCarouselView.configureView(with: viewModel.carouselViewData)

        signUpButton.setTitle(viewModel.signUpButtonTitle, for: .normal)

        let signInButtonItem = UIBarButtonItem(title: viewModel.signInButtonTitle, style: .plain, target: self, action: #selector(handleSignIn))
        let privacyButtonItem = UIBarButtonItem(title: viewModel.privacyButtonTitle, style: .plain, target: self, action: #selector(handlePrivacy))
        logo.setImage(viewModel.logoImage, for: .normal)
        let logoButtonItem = UIBarButtonItem(customView: logo)

        navigationItem.rightBarButtonItems = [signInButtonItem, privacyButtonItem]
        navigationItem.leftBarButtonItems = [logoButtonItem]
    }
}
