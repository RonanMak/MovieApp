//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject
{
//    func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
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
        view.backgroundColor = .blue
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
//    func doSomething()
//    {
//        let request = Home.Something.Request()
//        interactor?.doSomething(request: request)
//    }
//
//    func displaySomething(viewModel: Home.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}
