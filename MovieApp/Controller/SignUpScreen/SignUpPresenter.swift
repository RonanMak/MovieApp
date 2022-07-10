//
//  SignUpPresenter.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpPresentationLogic
{
    func presentViewInit()
    func presentSignUpButton(response: SignUp.SignUpButton.Response)
}

class SignUpPresenter
{
    weak var viewController: SignUpDisplayLogic?

}

extension SignUpPresenter: SignUpPresentationLogic {
    func presentViewInit() {
        let viewModel = SignUp.ViewInit.ViewModel(
            navigationTitle: "NETFLIX",
            backButtonIcon: "chevron.backward",
            emailInputPlaceholder: "Email",
            passwordInputPlaceholder: "Password",
            authButtonPlaceholder: "Sign Up"
        )

        viewController?.displayViewInit(viewModel: viewModel)
    }

    func presentSignUpButton(response: SignUp.SignUpButton.Response) {
        var signUpButtonColor: UIColor
        let isValid = response.isValid

        signUpButtonColor = isValid ? UIColor.AuthPage.netflixRed : UIColor.clear

        let viewModel = SignUp.SignUpButton.ViewModel(isValid: true, signUpButtonColor: signUpButtonColor)
        viewController?.displaySignUpButton(viewModel: viewModel)
    }
}
