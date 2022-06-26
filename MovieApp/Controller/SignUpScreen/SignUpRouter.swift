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
        let rootViewController = PrivacyViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController.modalPresentationStyle = .fullScreen

        viewController?.present(navigationController, animated: true)

//        let vc = UIViewController()
//        vc.view.backgroundColor = .red
//        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func routeToSignIn() {

        let viewController = UINavigationController(rootViewController: SignInViewController())
        viewController.navigationController?.pushViewController(viewController, animated: true)

    }
}
