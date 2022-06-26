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
}

class SignInPresenter
{
    weak var viewController: SignInDisplayLogic?

}

extension SignInPresenter: SignInPresentationLogic {
    func presentViewInit() {

        let emailInputPlaceholder = "Email or phone number"
        let passwordInputPlaceholder = "Password"
        let showPasswordButton = "SHOW"
        let authButtonPlaceholder = "Sign In"
        let recoverPasswordPlaceholder = "Recover Password"
        let learnMoreText = "Sign in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more."


        let viewModel = SignIn.ViewInit.ViewModel(
            emailInputPlaceholder: emailInputPlaceholder,
            passwordInputPlaceholder: passwordInputPlaceholder,
            showPasswordButton: showPasswordButton,
            authButtonPlaceholder: authButtonPlaceholder,
            recoverPasswordPlaceholder: recoverPasswordPlaceholder,
            learnMoreText: learnMoreText
        )
        viewController?.displayViewInit(viewModel: viewModel)
    }
}
