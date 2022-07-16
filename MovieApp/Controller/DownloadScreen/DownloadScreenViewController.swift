//
//  DownloadScreenViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 16/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DownloadScreenDisplayLogic: class
{
//    func displaySomething(viewModel: DownloadScreen.Something.ViewModel)
}

class DownloadScreenViewController: UIViewController, DownloadScreenDisplayLogic
{
    var interactor: DownloadScreenBusinessLogic?
    var router: (DownloadScreenRoutingLogic & DownloadScreenDataPassing)?
    
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
        view.backgroundColor = .red
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
//    func doSomething()
//    {
//        let request = DownloadScreen.Something.Request()
//        interactor?.doSomething(request: request)
//    }
//
//    func displaySomething(viewModel: DownloadScreen.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}
