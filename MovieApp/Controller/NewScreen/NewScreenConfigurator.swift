//
//  NewScreenConfigurator.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewScreenConfigurator
{
    class func createScene() -> NewScreenViewController
    {
        let viewController = NewScreenViewController(nibName: nil, bundle: nil)
        let interactor = NewScreenInteractor()
        let presenter = NewScreenPresenter()
        let router = NewScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
