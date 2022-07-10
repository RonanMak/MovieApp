//
//  SignUpInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpBusinessLogic
{
    func requestViewInit()
    func requestSignUpButton(request: SignUp.SignUpButton.Request)
    func requestSignUp(request: SignUp.HandleSignUp.Request)
}

protocol SignUpDataStore
{
    //var name: String { get set }
}

class SignUpInteractor: SignUpDataStore
{
    var presenter: SignUpPresentationLogic?
    var worker: SignUpWorker?
}

extension SignUpInteractor: SignUpBusinessLogic {
    func requestViewInit() {
        presenter?.presentViewInit()
    }

    func requestSignUpButton(request: SignUp.SignUpButton.Request) {
        
        let isValid = Helper.Auth.emailAndPasswordChecking(email: request.email, password: request.password)

        let response = SignUp.SignUpButton.Response(isValid: isValid)
        presenter?.presentSignUpButton(response: response)
    }

    func requestSignUp(request: SignUp.HandleSignUp.Request) {
        var isSignUpSuccess: Bool = true

        let email = request.email
        let password = request.password
        let username = request.username

        SignUpWorker.shared.registerUser(email: email, password: password, username: username) { error in
            if let error = error {
                print("failed to register user \(error.localizedDescription)")
                isSignUpSuccess = false
            }

            let response = SignUp.HandleSignUp.Response(isSignUpSuccess: isSignUpSuccess)
            self.presenter?.presentSignUp(response: response)
        }
    }
}
