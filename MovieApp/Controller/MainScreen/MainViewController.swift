//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainDisplayLogic: AnyObject
{
}

class MainViewController: UIViewController, MainDisplayLogic
{

    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()


    var interactor: MainBusinessLogic?
    var router: (MainRoutingLogic & MainDataPassing)?
    
    // MARK: Object lifecycle
    
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
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .lightGray

        view.addSubview(signInButton)
        signInButton.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, height: 100)
    }

    @objc func handleSignIn() {
        let vc = HomeConfigurator.createScene()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        self.present(nav, animated: true)
    }
}
