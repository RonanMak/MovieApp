//
//  SignInInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInBusinessLogic
{
    func requestViewInit()
    func requestShowPassword(request: SignIn.ShowPasswordButton.Request)
    func requestAuthButton(request: SignIn.AuthButton.Request)
}

protocol SignInDataStore
{
    //var name: String { get set }
}

class SignInInteractor: SignInDataStore
{
    var presenter: SignInPresentationLogic?
    var worker: SignInWorker?

}

extension SignInInteractor: SignInBusinessLogic {
    func requestAuthButton(request: SignIn.AuthButton.Request) {
        var isValid: Bool = false

        // is valid email?
        let emailResult = request.email.range(
            of: Constants.RegularExpression.emailPattern,
            options: .regularExpression
        )
        let isValidEmail = (emailResult != nil)

        // is valid password?
        let passwordResult = request.password.range(
            of: Constants.RegularExpression.passwordPattern,
            options: .regularExpression
        )
        let isValidPassword = (passwordResult != nil)

        isValid = isValidEmail && isValidPassword ? true : false

        let response = SignIn.AuthButton.Response(isValid: isValid)
        presenter?.presentAuthButton(response: response)
    }

    func requestViewInit() {
        presenter?.presentViewInit()
    }

    func requestShowPassword(request: SignIn.ShowPasswordButton.Request) {
        let response = SignIn.ShowPasswordButton.Response(isSecureTextEntry: request.isSecureTextEntry)
        presenter?.presentShowPassword(response: response)
    }
}
