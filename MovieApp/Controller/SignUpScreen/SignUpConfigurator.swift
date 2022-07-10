//
//  SignUpConfigurator.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SignUpConfigurator
{
    class func createScene() -> SignUpViewController
    {
        let viewController = SignUpViewController(nibName: nil, bundle: nil)
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
