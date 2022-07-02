//
//  SignUpRouter.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpRoutingLogic
{
    func routeToPrivacy()
    func routeToSignIn()
}

protocol SignUpDataPassing
{
    var dataStore: SignUpDataStore? { get }
}

class SignUpRouter: SignUpDataPassing
{
    weak var viewController: SignUpViewController?
    var dataStore: SignUpDataStore?
}

// MARK: - SignUpRoutingLogic

extension SignUpRouter: SignUpRoutingLogic {
    func routeToPrivacy() {
        let rootViewController = PrivacyConfigurator.createScene()
        let navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true)
    }

    func routeToSignIn() {
        let vc = SignInConfigurator.createScene()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
