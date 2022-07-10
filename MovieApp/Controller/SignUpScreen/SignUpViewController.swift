//
//  SignUpViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

protocol SignUpDisplayLogic: AnyObject
{
    func displayViewInit(viewModel: SignUp.ViewInit.ViewModel)
    func displaySignUpButton(viewModel: SignUp.SignUpButton.ViewModel)
}

class SignUpViewController: UIViewController
{
    // MARK: - Properties

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

    private lazy var authButton: UIButton = {
        let button = UIButton().authButton()
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    var interactor: SignUpBusinessLogic?
    var router: (SignUpRoutingLogic & SignUpDataPassing)?
    
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
        interactor?.requestViewInit()
    }

    // MARK: - Set up views

    private func setupView() {
        view.backgroundColor = UIColor.AuthPage.signInPageBackgroundColor

        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            authButton
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

    }

    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()

        // background color
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .black
        // title color
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
        //  item color
        navigationController?.navigationBar.tintColor = .white

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }

    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Actions

    @objc func handleSignUp() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        
    }

    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }

    @objc func textDidChange(_ sender: UITextField) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        let request = SignUp.SignUpButton.Request(email: email, password: password)
        interactor?.requestSignUpButton(request: request)
    }
}

extension SignUpViewController: SignUpDisplayLogic {

    func displayViewInit(viewModel: SignUp.ViewInit.ViewModel) {
        title = viewModel.navigationTitle

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: viewModel.backButtonIcon), style: .plain, target: self, action: #selector(dismissView))

        emailTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.placeholder = viewModel.passwordInputPlaceholder
        authButton.setTitle(viewModel.authButtonPlaceholder, for: .normal)
    }

    func displaySignUpButton(viewModel: SignUp.SignUpButton.ViewModel) {
        authButton.backgroundColor = viewModel.signUpButtonColor
        authButton.isEnabled = viewModel.isValid
    }
}
