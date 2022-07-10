//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject
{
    func displayViewInit(viewModel: HomeModel.ViewInit.ViewModel)
}

class HomeViewController: UIViewController
{
    // MARK: - Properties
    private lazy var signInButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(handleSignIn))
        return item
    }()

    private lazy var privacyButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(handlePrivacy))
        return item
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton().signUpButton(withText: nil)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()

    private lazy var homeCarouselView = HomeCarouselView()
    private lazy var logo = UIButton()
    
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
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
        view.addSubview(homeCarouselView)
        view.addSubview(signUpButton)

        homeCarouselView.anchor(
            top: view.topAnchor,
            bottom: view.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor
        )
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

//        let navigationBarAppearance = UINavigationBarAppearance()
        // background color
//        navigationBarAppearance.configureWithDefaultBackground()
//        navigationBarAppearance.backgroundColor = .black
//        // title color
//        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
    }
    
    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handle button actions
    @objc func handleSignUp() {
        router?.routeToSignUp()
    }
    
    @objc func handleSignIn() {
        router?.routeToSignIn()
    }
    
    @objc func handlePrivacy() {
        router?.routeToPrivacy()
    }
}

// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayLogic {
    func displayViewInit(viewModel: HomeModel.ViewInit.ViewModel) {

        signInButtonItem.title = viewModel.signInButtonTitle
        privacyButtonItem.title = viewModel.privacyButtonTitle
        signUpButton.setTitle(viewModel.signUpButtonTitle, for: .normal)
        
        homeCarouselView.configureView(with: viewModel.carouselViewData)

        logo.setImage(viewModel.logoImage, for: .normal)
        let logoButtonItem = UIBarButtonItem(customView: logo)
        navigationItem.rightBarButtonItems = [signInButtonItem, privacyButtonItem]
        navigationItem.leftBarButtonItems = [logoButtonItem]
    }
}
