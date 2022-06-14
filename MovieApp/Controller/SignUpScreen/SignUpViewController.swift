//
//  SignUpViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpDisplayLogic: AnyObject
{
//    func displaySomething(viewModel: SignUp.Something.ViewModel)
}

class SignUpViewController: UIViewController, SignUpDisplayLogic
{

    private lazy var signUpButton: UIButton = {
        let button = UIButton().signUpButton(withText: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()

    var interactor: SignUpBusinessLogic?
    var router: (SignUpRoutingLogic & SignUpDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupViews()
    }
    
    // MARK: - Set up views
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(signUpButton)

    }

    // MARK: - Handle button actions
    @objc func handleSignUp() {

    }
}
