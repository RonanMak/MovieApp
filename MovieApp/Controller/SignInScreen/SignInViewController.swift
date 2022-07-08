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
    func displayAuthButton(viewModel: SignIn.AuthButton.ViewModel)
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
        emailTextField.delegate = self
        passwordTextField.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        stackView.anchor(
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingLeft: 40, paddingRight: 40
        )

        view.addSubview(showButton)

        showButton.centerY(inView: passwordTextField)
        showButton.anchor(right: passwordTextField.rightAnchor,
                          paddingRight: 15
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
        passwordTextField.isSecureTextEntry.toggle()
        let request = SignIn.ShowPasswordButton.Request(isSecureTextEntry: passwordTextField.isSecureTextEntry)
        interactor?.requestShowPassword(request: request)
    }

    @objc func handleSignIn() {
    }

    @objc func handleRecoverPassword() {

    }

    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func textDidChange() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        let request = SignIn.AuthButton.Request(email: email, password: password)
        interactor?.requestAuthButton(request: request)
    }

    @objc func keyboardShow(_ notification: Notification) {
        //從userInfo中取得鍵盤的frame -> size
        let userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let intersection = keyboardSize.intersection(view.frame)

        view.frame.size = CGSize(width: view.frame.width, height: view.frame.height - intersection.height)

    }

    @objc func keyboardHide(_ notification: Notification) {
        view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

    }
}

extension SignInViewController: SignInDisplayLogic {

    func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {

        backButtonItem.image = viewModel.backButtonImage
        helpButtonItem.title = viewModel .helpButtonText

        logoImage.setImage(viewModel.logoImage, for: .normal)
        emailTextField.placeholder = viewModel.emailInputPlaceholder
        passwordTextField.placeholder = viewModel.passwordInputPlaceholder

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

    func displayAuthButton(viewModel: SignIn.AuthButton.ViewModel) {
        authButton.containerView.backgroundColor = viewModel.signInButtonColor
    }
}


// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        emailTextField.backgroundColor = .green
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField)
    {

    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        emailTextField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
        return true
    }


    func textFieldDidEndEditing(_ textField: UITextField)
    {
        emailTextField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
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

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField => textField.text 可取得輸入框的值
//        range => range.location 可取得從第幾個字元開始輸入或複製貼上的 index
//        string => 可取得當下輸入或複製貼上的字串
        return true
    }
}
