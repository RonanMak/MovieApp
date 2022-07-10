//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeRoutingLogic
{
    func routeToPrivacy()
    func routeToSignIn()
    func routeToSignUp()
}

protocol HomeDataPassing
{
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: HomeDataPassing
{
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
}

// MARK: - HomeRoutingLogic

extension HomeRouter: HomeRoutingLogic {
    func routeToPrivacy() {
        let rootViewController = PrivacyConfigurator.createScene()
        let navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true)
    }

    func routeToSignIn() {
        let signInViewController = SignInConfigurator.createScene()
        viewController?.navigationController?.pushViewController(signInViewController, animated: true)
    }

    func routeToSignUp() {
        let signUpViewController = SignUpConfigurator.createScene()
        viewController?.navigationController?.pushViewController(signUpViewController, animated: true)

    }
}
