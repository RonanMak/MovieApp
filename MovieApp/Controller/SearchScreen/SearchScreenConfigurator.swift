//
//  SearchScreenConfigurator.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchScreenConfigurator
{
    class func createScene() -> SearchScreenViewController
    {
        let viewController = SearchScreenViewController(nibName: nil, bundle: nil)
        let interactor = SearchScreenInteractor()
        let presenter = SearchScreenPresenter()
        let router = SearchScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
