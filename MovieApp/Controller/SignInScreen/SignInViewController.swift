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

    enum Dimen {
        static let paddingTop: CGFloat = 20
        static let paddingBottom: CGFloat = 20
        static let paddingLeft: CGFloat = 20
        static let paddingRight: CGFloat = 20

        static let resetButtonHeight: CGFloat = 48

        static let smallFontSize: CGFloat = 14
        static let mediumFontSize: CGFloat = 16
        static let largeFontSize: CGFloat = 18

        static let commonAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: smallFontSize, weight: .bold),
            NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
    }

    // MARK: - Properties
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
        label.font = UIFont.systemFont(ofSize: Dimen.smallFontSize)
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
        setupView()
        interactor?.requestViewInit()
    }

    private func setup() {
        let viewController = self
        let interactor = SignInInteractor()
        let presenter = SignInPresenter()
        let router = SignInRouter()
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

    private func setupView() {
        view.backgroundColor = UIColor.AuthPage.authPageBackgroundColor
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(authButton)
        view.addSubview(resetPasswordButton)
        view.addSubview(label)
        view.addSubview(showButton)

        emailTextField.anchor(
            bottom: passwordTextField.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingBottom: Dimen.paddingBottom,
            paddingLeft: Dimen.paddingLeft,
            paddingRight: Dimen.paddingRight
        )

        passwordTextField.centerXAndYAnchor(view: view)
        passwordTextField.anchor(
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: Dimen.paddingTop,
            paddingLeft: Dimen.paddingLeft,
            paddingRight: Dimen.paddingRight
        )

        showButton.centerYAnchor(view: passwordTextField)
        showButton.anchor(right: passwordTextField.rightAnchor, paddingRight: Dimen.paddingRight * 2)

        authButton.anchor(
            top: passwordTextField.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: Dimen.paddingTop,
            paddingLeft: Dimen.paddingLeft,
            paddingRight: Dimen.paddingRight
        )

        resetPasswordButton.anchor(
            top: authButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: Dimen.paddingTop,
            paddingLeft: Dimen.paddingLeft,
            paddingRight: Dimen.paddingRight,
            height: Dimen.resetButtonHeight
        )

        label.anchor(
            top: resetPasswordButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: Dimen.paddingTop,
            paddingLeft: Dimen.paddingLeft,
            paddingRight: Dimen.paddingRight * 2
        )
    }
    
    // MARK: - Actions

    @objc func showPassword() {
        passwordTextField.jTextField.isSecureTextEntry.toggle()

        if passwordTextField.jTextField.isSecureTextEntry {
            let showPasswordAttributedTitle = NSMutableAttributedString(
                string: "SHOW",
                attributes: Dimen.commonAttribute
            )
            showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        } else {
            let showPasswordAttributedTitle = NSMutableAttributedString(
                string: "HIDE",
                attributes: Dimen.commonAttribute
            )
            showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        }

    }

    @objc func handleSignIn() {
    }

    @objc func handleRecoverPassword() {

    }
}

extension SignInViewController: SignInDisplayLogic {
    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {

        emailTextField.jTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.jTextField.placeholder = viewModel.passwordInputPlaceholder

        let showPasswordAttributedTitle = NSMutableAttributedString(
            string: viewModel.showPasswordButton,
            attributes: Dimen.commonAttribute
        )
        let authButtonAttributedTitle = NSMutableAttributedString(
            string: viewModel.authButtonPlaceholder,
            attributes: Dimen.commonAttribute
            )
        let resetPasswordAttributedTitle = NSMutableAttributedString(
            string: viewModel.recoverPasswordPlaceholder,
            attributes: Dimen.commonAttribute
        )
        showButton.setAttributedTitle(showPasswordAttributedTitle, for: .normal)
        authButton.authAttributedButton.setAttributedTitle(authButtonAttributedTitle, for: .normal)
        resetPasswordButton.setAttributedTitle(resetPasswordAttributedTitle, for: .normal)
        label.text = viewModel.learnMoreText
    }
}
