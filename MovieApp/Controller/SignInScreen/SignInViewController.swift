//
//  SignInViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInDisplayLogic: AnyObject
{
//    func displaySomething(viewModel: SignIn.Something.ViewModel)
}

class SignInViewController: UIViewController, SignInDisplayLogic
{
    var interactor: SignInBusinessLogic?
    var router: (SignInRoutingLogic & SignInDataPassing)?
    
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
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
//    func doSomething()
//    {
//        let request = SignIn.Something.Request()
//        interactor?.doSomething(request: request)
//    }
//
//    func displaySomething(viewModel: SignIn.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}
