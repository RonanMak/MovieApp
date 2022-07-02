//
//  NewScreenViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewScreenDisplayLogic: AnyObject
{
//    func displaySomething(viewModel: NewScreen.Something.ViewModel)
}

class NewScreenViewController: UIViewController, NewScreenDisplayLogic
{
    var interactor: NewScreenBusinessLogic?
    var router: (NewScreenRoutingLogic & NewScreenDataPassing)?
    
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
        view.backgroundColor = .yellow
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
//    func doSomething()
//    {
//        let request = NewScreen.Something.Request()
//        interactor?.doSomething(request: request)
//    }
//
//    func displaySomething(viewModel: NewScreen.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}
