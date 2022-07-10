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
    func requestSignInButton(request: SignIn.SignInButton.Request)
    func requestSignIn(request: SignIn.SignIn.Request)
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
    func requestSignInButton(request: SignIn.SignInButton.Request) {

        let isValid = Helper.Auth.emailAndPasswordChecking(email: request.email, password: request.password)

        let response = SignIn.SignInButton.Response(isValid: isValid)
        presenter?.presentSignInButton(response: response)
    }

    func requestViewInit() {
        presenter?.presentViewInit()
    }

    func requestShowPassword(request: SignIn.ShowPasswordButton.Request) {
        let response = SignIn.ShowPasswordButton.Response(isSecureTextEntry: request.isSecureTextEntry)
        presenter?.presentShowPassword(response: response)
    }

    func requestSignIn(request: SignIn.SignIn.Request) {
        var isSignInSuccess: Bool = true

        let email = request.email
        let password = request.password

        SignInWorker.shared.userSignIn(email: email, password: password) { (result, error) in
            if let error = error {
                print("failed to sign in user \(error.localizedDescription)")
                isSignInSuccess = false
            }

            let response = SignIn.SignIn.Response(isSignInSuccess: isSignInSuccess)
            self.presenter?.presentSignIn(response: response)
        }
    }
}
