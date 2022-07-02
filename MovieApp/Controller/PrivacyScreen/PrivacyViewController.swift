//
//  PrivacyViewController.swift
//  MovieApp
//
//  Created by Ronan Mak on 18/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PrivacyDisplayLogic: AnyObject
{
    func displayViewInit(viewModel: PrivacyModel.ViewInit.ViewModel)
}

class PrivacyViewController: UIViewController
{

    // MARK: - Properties
    private lazy var longString: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }()

    var interactor: PrivacyBusinessLogic?
    var router: (PrivacyRoutingLogic & PrivacyDataPassing)?

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
        setUpView()
        setUpNavigationBar()
        interactor?.requestViewInit()
    }

    // MARK: - Set up views

    private func setUpView() {
        view.addSubview(longString)
        longString.anchor(
            top: view.topAnchor,
            bottom: view.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingRight: 20
        )
    }

    private func setUpNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()

        // background color
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .white
        // title color
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
        //  item color
        navigationController?.navigationBar.tintColor = .black

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }
    
    // MARK: - Handle button actions
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

extension PrivacyViewController: PrivacyDisplayLogic {
    func displayViewInit(viewModel: PrivacyModel.ViewInit.ViewModel) {
        
        title = viewModel.navigationTitle
        longString.text = viewModel.longString
        longString.isScrollEnabled = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: viewModel.backButtonIcon), style: .plain, target: self, action: #selector(dismissView))
    }
}
