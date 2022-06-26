//
//  PrivacyRouter.swift
//  MovieApp
//
//  Created by Ronan Mak on 18/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PrivacyRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PrivacyDataPassing
{
    var dataStore: PrivacyDataStore? { get }
}

class PrivacyRouter: PrivacyRoutingLogic, PrivacyDataPassing
{
    weak var viewController: PrivacyViewController?
    var dataStore: PrivacyDataStore?
    
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
    
    //func navigateToSomewhere(source: PrivacyViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: PrivacyDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
