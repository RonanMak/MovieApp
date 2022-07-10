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
        
        let isValid = HelperFunction.Auth.emailAndPasswordChecking(email: request.email, password: request.password)

        let response = SignUp.SignUpButton.Response(isValid: isValid)
        presenter?.presentSignUpButton(response: response)
    }
}
