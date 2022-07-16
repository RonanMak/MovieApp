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
    func displaySignInButton(viewModel: SignIn.SignInButton.ViewModel)
    func displaySignIn(viewModel: SignIn.SignIn.ViewModel)
}

class SignInViewController: UIViewController
{

    // MARK: - Properties

    private lazy var logoImage: UIButton = {
        let button = UIButton()
        return button
    }()

    private let emailTextField: JVFloatLabeledTextField = {
        let placeholder = JVFloatLabeledTextField().customfloatLabeledTextField(withText: nil)
//        placeholder.clearButtonMode = .always
        placeholder.keyboardType = .emailAddress
        placeholder.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return placeholder
    }()

    private let passwordTextField: JVFloatLabeledTextField = {
        let placeholder = JVFloatLabeledTextField().customfloatLabeledTextField(withText: nil)
//        placeholder.clearButtonMode = .always
        placeholder.isSecureTextEntry = true
        placeholder.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
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

    private lazy var authButton: UIButton = {
        let button = UIButton().authButton()
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        button.isEnabled = false
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
        let item = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(dismissView))
        return item
    }()

    private lazy var helpButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        return item
    }()

    private var activityIndicator = UIActivityIndicatorView()

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
        setupNavigationBar()
        setupDelegate()
        setupActivityIndicator(indicatorView: activityIndicator)
        interactor?.requestViewInit()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    // MARK: - Set up views

    override open var shouldAutorotate: Bool {
        return false
    }

    private func setupView() {
        view.backgroundColor = UIColor.AuthPage.signInPageBackgroundColor

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
        stackView.anchor(
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingLeft: 40,
            paddingRight: 40
        )

        view.addSubview(showButton)

        showButton.centerY(inView: passwordTextField)
        showButton.anchor(
            right: passwordTextField.rightAnchor,
            paddingRight: 15
        )
    }

    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func setupNavigationBar() {
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
        passwordTextField.isSecureTextEntry.toggle()
        let request = SignIn.ShowPasswordButton.Request(isSecureTextEntry: passwordTextField.isSecureTextEntry)
        interactor?.requestShowPassword(request: request)
    }

    @objc func handleSignIn() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityIndicator.startAnimating()
            strongSelf.view.isUserInteractionEnabled = false
        }

        let request = SignIn.SignIn.Request(email: email, password: password)
        interactor?.requestSignIn(request: request)
    }

    @objc func handleRecoverPassword() {

    }

    @objc func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func textDidChange(_ sender: UITextField) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        let request = SignIn.SignInButton.Request(email: email, password: password)
        interactor?.requestSignInButton(request: request)
    }
}

// MARK: - SignInDisplayLogic

extension SignInViewController: SignInDisplayLogic {

    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {
        backButtonItem.image = viewModel.backButtonImage
        helpButtonItem.title = viewModel .helpButtonText

        logoImage.setImage(viewModel.logoImage, for: .normal)
        emailTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.placeholder = viewModel.passwordInputPlaceholder

//        let authButtonAttributedTitle = NSMutableAttributedString(
//            string: viewModel.authButtonPlaceholder,
//            attributes: Constants.Dimen.commonAttribute
//            )
//        let resetPasswordAttributedTitle = NSMutableAttributedString(
//            string: viewModel.recoverPasswordPlaceholder,
//            attributes: Constants.Dimen.commonAttribute
//        )
        showButton.configuration?.title = viewModel.showPasswordButton
        authButton.setTitle(viewModel.authButtonPlaceholder, for: .normal)
        resetPasswordButton.setTitle(viewModel.recoverPasswordPlaceholder, for: .normal)
        safetyText.text = viewModel.learnMoreText
    }

    func displayShowPassword(viewModel: SignIn.ShowPasswordButton.ViewModel) {
        self.showButton.configurationUpdateHandler = { [weak self] button in
            guard let _ = self else { return }
            button.configuration?.title = viewModel.attributedString
        }
    }

    func displaySignInButton(viewModel: SignIn.SignInButton.ViewModel) {
        authButton.backgroundColor = viewModel.signInButtonColor
        authButton.isEnabled = viewModel.isValid
    }

    func displaySignIn(viewModel: SignIn.SignIn.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityIndicator.stopAnimating()
            strongSelf.view.isUserInteractionEnabled = true
        }

        if viewModel.isSignInSuccess {
            dismiss(animated: true)
        } else {
            Helper.Alert.showAlert(viewController: self, title: viewModel.alertTitle, message: viewModel.alertMessage)
            passwordTextField.text = ""
        }
    }
}

// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        textField.backgroundColor = UIColor.AuthPage.JVFTextFieldBeginEditing
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.backgroundColor = UIColor.AuthPage.JVFTextFieldBgColor
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
