//
//  DownloadScreenConfigurator.swift
//  MovieApp
//
//  Created by Ronan Mak on 16/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DownloadScreenConfigurator
{
    class func createScene() -> DownloadScreenViewController
    {
        let viewController = DownloadScreenViewController(nibName: nil, bundle: nil)
        let interactor = DownloadScreenInteractor()
        let presenter = DownloadScreenPresenter()
        let router = DownloadScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
