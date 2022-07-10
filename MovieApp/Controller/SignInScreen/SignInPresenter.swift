//
//  SignInPresenter.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInPresentationLogic
{
    func presentViewInit()
    func presentShowPassword(response: SignIn.ShowPasswordButton.Response)
    func presentSignInButton(response: SignIn.SignInButton.Response)
}

class SignInPresenter
{
    weak var viewController: SignInDisplayLogic?
}

extension SignInPresenter: SignInPresentationLogic {
    func presentViewInit() {

        let logoImage = UIImage(named: "netflix-logo") ?? UIImage()
        let backButtonImage = UIImage(systemName: "chevron.left") ?? UIImage()
        let helpButtonText = "help"
        let emailInputPlaceholder = "Email or phone number"
        let passwordInputPlaceholder = "Password"
        let showPasswordButton = "SHOW"
        let authButtonPlaceholder = "Sign In"
        let recoverPasswordPlaceholder = "Recover Password"
        let learnMoreText = "Sign in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more."

        let viewModel = SignIn.ViewInit.ViewModel(
            logoImage: logoImage,
            backButtonImage: backButtonImage,
            helpButtonText: helpButtonText,
            emailInputPlaceholder: emailInputPlaceholder,
            passwordInputPlaceholder: passwordInputPlaceholder,
            showPasswordButton: showPasswordButton,
            authButtonPlaceholder: authButtonPlaceholder,
            recoverPasswordPlaceholder: recoverPasswordPlaceholder,
            learnMoreText: learnMoreText
        )
        viewController?.displayViewInit(viewModel: viewModel)
    }

    func presentShowPassword(response: SignIn.ShowPasswordButton.Response) {
        var attributedString: String

        if response.isSecureTextEntry {
            let showPasswordAttributedTitle = "SHOW"
            attributedString = showPasswordAttributedTitle
        } else {
            let showPasswordAttributedTitle = "HIDE"
            attributedString = showPasswordAttributedTitle
        }

        let viewModel = SignIn.ShowPasswordButton.ViewModel(attributedString: attributedString)
        viewController?.displayShowPassword(viewModel: viewModel)
    }

    func presentSignInButton(response: SignIn.SignInButton.Response) {
        var signInButtonColor: UIColor
        let isValid = response.isValid

        signInButtonColor = isValid ? UIColor.AuthPage.netflixRed : UIColor.clear

        let viewModel = SignIn.SignInButton.ViewModel(isValid: isValid, signInButtonColor: signInButtonColor)
        viewController?.displaySignInButton(viewModel: viewModel)
    }
}
