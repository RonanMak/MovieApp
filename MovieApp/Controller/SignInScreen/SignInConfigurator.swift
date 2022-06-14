//
//  SignInConfigurator.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SignInConfigurator
{
    class func createScene() -> SignInViewController
    {
        let viewController = SignInViewController(nibName: nil, bundle: nil)
        let interactor = SignInInteractor()
        let presenter = SignInPresenter()
        let router = SignInRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
