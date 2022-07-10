//
//  SignUpModels.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SignUp
{
    enum ViewInit {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            let navigationTitle: String
            let backButtonIcon: String
            let emailInputPlaceholder: String
            let passwordInputPlaceholder: String
            let authButtonPlaceholder: String
        }
    }

    enum SignUpButton {
        struct Request {
            let email: String
            let password: String
        }
        struct Response {
            let isValid: Bool
        }
        struct ViewModel {
            let isValid: Bool
            let signUpButtonColor: UIColor
        }
    }

    enum HandleSignUp {
        struct Request {
            let email: String
            let password: String
//            let username: String
        }
        struct Response {
            let isSignUpSuccess: Bool
        }
        struct ViewModel {
            let isSignUpSuccess: Bool
            let alertTitle: String?
            let alertMessage: String?
        }
    }
}
