//
//  SearchScreenViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchScreenDisplayLogic: AnyObject
{
//    func displaySomething(viewModel: SearchScreen.Something.ViewModel)
}

class SearchScreenViewController: UIViewController, SearchScreenDisplayLogic
{
    var interactor: SearchScreenBusinessLogic?
    var router: (SearchScreenRoutingLogic & SearchScreenDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
//    func doSomething()
//    {
//        let request = SearchScreen.Something.Request()
//        interactor?.doSomething(request: request)
//    }
//
//    func displaySomething(viewModel: SearchScreen.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}
