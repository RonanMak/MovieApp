//
//  SignInViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

protocol SignInDisplayLogic: AnyObject
{
    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel)
    func displayShowPassword(viewModel: SignIn.ShowPasswordButton.ViewModel)
}

class SignInViewController: UIViewController
{

    // MARK: - Properties

    private lazy var logoImage: UIButton = {
        let button = UIButton()
        return button
    }()

    private let emailTextField: PlaceholderTextField = {
        let placeholder = PlaceholderTextField()
        return placeholder
    }()

    private let passwordTextField: PlaceholderTextField = {
        let placeholder = PlaceholderTextField()
        placeholder.jTextField.isSecureTextEntry = true
        return placeholder
    }()

    private lazy var showButton: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        button.configuration = config

        button.tintColor = .gray
        button.addTarget(self, action: #selector(handleShowPassword), for: .touchUpInside)
        return button
    }()

    private lazy var authButton: AuthButton = {
        let button = AuthButton()
        button.authAttributedButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()

    private lazy var resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleRecoverPassword), for: .touchUpInside)
        return button
    }()

    private let safetyText: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var backButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(handleBack))
        return item
    }()

    private lazy var helpButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        return item
    }()

    var interactor: SignInBusinessLogic?
    var router: (SignInRoutingLogic & SignInDataPassing)?
    
    // MARK: Object lifecycle
    
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
        setupView()
        setUpNavigationBar()
        interactor?.requestViewInit()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Set up views

    override open var shouldAutorotate: Bool {
        return false
    }

    private func setupView() {
        view.backgroundColor = UIColor.AuthPage.authPageBackgroundColor

        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            authButton,
            resetPasswordButton,
            safetyText
        ])

        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.centerX(inView: view)
        stackView.centerY(inView: view)
        stackView.anchor(left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 20, paddingRight: 20
        )

        view.addSubview(showButton)

        showButton.centerY(inView: passwordTextField)
        showButton.anchor(right: passwordTextField.rightAnchor,
                          paddingRight: 30
        )
    }

    private func setUpNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)

        let navigationBarAppearance = UINavigationBarAppearance()
        // background color
//        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .black
        // title color
//        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
        //  item color
        navigationController?.navigationBar.tintColor = .white
//        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]

//        navigationItem.standardAppearance = navigationBarAppearance
//        navigationItem.compactAppearance = navigationBarAppearance
//        navigationItem.scrollEdgeAppearance = navigationBarAppearance

        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.rightBarButtonItem = helpButtonItem
        navigationItem.titleView = logoImage
    }

    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions

    @objc func handleShowPassword() {
        passwordTextField.jTextField.isSecureTextEntry.toggle()
        let request = SignIn.ShowPasswordButton.Request(isSecureTextEntry: passwordTextField.jTextField.isSecureTextEntry)
        interactor?.requestShowPassword(request: request)
    }

    @objc func handleSignIn() {
        dismiss(animated: true)
    }

    @objc func handleRecoverPassword() {

    }

    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignInViewController: SignInDisplayLogic {
    func displayAuthButtonColor() {

    }

    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {

        backButtonItem.image = viewModel.backButtonImage
        helpButtonItem.title = viewModel .helpButtonText

        logoImage.setImage(viewModel.logoImage, for: .normal)
        emailTextField.jTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.jTextField.placeholder = viewModel.passwordInputPlaceholder

        let authButtonAttributedTitle = NSMutableAttributedString(
            string: viewModel.authButtonPlaceholder,
            attributes: Constants.Dimen.commonAttribute
            )
        let resetPasswordAttributedTitle = NSMutableAttributedString(
            string: viewModel.recoverPasswordPlaceholder,
            attributes: Constants.Dimen.commonAttribute
        )
        showButton.configuration?.title = viewModel.showPasswordButton
        authButton.authAttributedButton.setAttributedTitle(authButtonAttributedTitle, for: .normal)
        resetPasswordButton.setAttributedTitle(resetPasswordAttributedTitle, for: .normal)
        safetyText.text = viewModel.learnMoreText
    }

    func displayShowPassword(viewModel: SignIn.ShowPasswordButton.ViewModel) {
        self.showButton.configurationUpdateHandler = { [weak self] button in
            guard let _ = self else { return }
            button.configuration?.title = viewModel.attributedString
        }
    }
}

