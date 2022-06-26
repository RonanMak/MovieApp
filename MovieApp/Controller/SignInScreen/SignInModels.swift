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
            let emailInputPlaceholder: String
            let passwordInputPlaceholder: String
            let showPasswordButton: String
            let authButtonPlaceholder: String
            let recoverPasswordPlaceholder: String
            let learnMoreText: String
        }
    }
}
