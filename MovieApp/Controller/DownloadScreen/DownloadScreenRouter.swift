//
//  DownloadScreenRouter.swift
//  MovieApp
//
//  Created by Ronan Mak on 16/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DownloadScreenRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DownloadScreenDataPassing
{
    var dataStore: DownloadScreenDataStore? { get }
}

class DownloadScreenRouter: DownloadScreenRoutingLogic, DownloadScreenDataPassing
{
    weak var viewController: DownloadScreenViewController?
    var dataStore: DownloadScreenDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: DownloadScreenViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: DownloadScreenDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
