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
}

class SignInViewController: UIViewController
{

    // MARK: - Properties
    private lazy var logo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "netflix-logo"), for: .normal)
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
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
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

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
            label
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
                          paddingRight: 40
        )
    }

    private func setUpNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()

        // background color
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .black
        // title color
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
        //  item color
        navigationController?.navigationBar.tintColor = .white
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        navigationController?.setNavigationBarHidden(false, animated: false)

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance

        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(handleDismiss))

        let helpButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: nil)

        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.rightBarButtonItem = helpButtonItem
        navigationItem.titleView = logo
    }

    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions

    @objc func showPassword() {
        passwordTextField.jTextField.isSecureTextEntry.toggle()

        if passwordTextField.jTextField.isSecureTextEntry {
            let showPasswordAttributedTitle = NSMutableAttributedString(
                string: "SHOW",
                attributes: Constants.Dimen.commonAttribute
            )
            showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        } else {
            let showPasswordAttributedTitle = NSMutableAttributedString(
                string: "HIDE",
                attributes: Constants.Dimen.commonAttribute
            )
            showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        }

    }

    @objc func handleSignIn() {
        dismiss(animated: true)
    }

    @objc func handleRecoverPassword() {

    }

    @objc func handleDismiss() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignInViewController: SignInDisplayLogic {
    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {

        emailTextField.jTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.jTextField.placeholder = viewModel.passwordInputPlaceholder

        let showPasswordAttributedTitle = NSMutableAttributedString(
            string: viewModel.showPasswordButton,
            attributes: Constants.Dimen.commonAttribute
        )
        let authButtonAttributedTitle = NSMutableAttributedString(
            string: viewModel.authButtonPlaceholder,
            attributes: Constants.Dimen.commonAttribute
            )
        let resetPasswordAttributedTitle = NSMutableAttributedString(
            string: viewModel.recoverPasswordPlaceholder,
            attributes: Constants.Dimen.commonAttribute
        )
        showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        authButton.authAttributedButton.setAttributedTitle(authButtonAttributedTitle, for: .normal)
        resetPasswordButton.setAttributedTitle(resetPasswordAttributedTitle, for: .normal)
        label.text = viewModel.learnMoreText
    }
}
