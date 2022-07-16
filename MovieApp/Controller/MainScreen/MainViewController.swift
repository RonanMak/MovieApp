//
//  MainViewController.swift
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

    private lazy var homeFeedTableView: UITableView = {
        let tableView = UITableView()
        return tableView
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
        setupHomeFeedTableView()
        setupNavigationBar()
        setupConstraint()
    }

    // MARL: - Setup views

    private func setupUI() {
        view.backgroundColor = .lightGray
        view.addSubview(homeFeedTableView)
    }

    private func setupHomeFeedTableView() {
        homeFeedTableView.delegate = self
        homeFeedTableView.dataSource = self
        homeFeedTableView.register(
            UITableViewCell.self, forCellReuseIdentifier: "cell"
        )
    }

    private func setupConstraint() {
        homeFeedTableView.frame = view.bounds
    }

    // MARL: - Setup navigation bar
    func setupNavigationBar() {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
          imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
          imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

          let titleLabel = UILabel()
          titleLabel.text = "Your title"

          let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
          stackView.spacing = 5
          stackView.alignment = .center

          // This will assing your custom view to navigation title.
          navigationItem.titleView = stackView
    }

    @objc func handleSignIn() {
//        let vc = HomeConfigurator.createScene()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.modalPresentationStyle = .fullScreen
//        nav.setNavigationBarHidden(true, animated: false)
//        self.present(nav, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell 
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
