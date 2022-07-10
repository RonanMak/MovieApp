//
//  SignInModels.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SignIn
{
    enum ViewInit {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            let logoImage: UIImage
            let backButtonImage: UIImage
            let helpButtonText: String
            let emailInputPlaceholder: String
            let passwordInputPlaceholder: String
            let showPasswordButton: String
            let authButtonPlaceholder: String
            let recoverPasswordPlaceholder: String
            let learnMoreText: String
        }
    }

    enum ShowPasswordButton {
        struct Request {
            var isSecureTextEntry: Bool
        }
        struct Response {
            let isSecureTextEntry: Bool
        }
        struct ViewModel {
            let attributedString: String
        }
    }

    enum SignInButton {
        struct Request {
            let email: String
            let password: String
        }
        struct Response {
            let isValid: Bool
        }
        struct ViewModel {
            let isValid: Bool
            let signInButtonColor: UIColor
        }
    }
}
