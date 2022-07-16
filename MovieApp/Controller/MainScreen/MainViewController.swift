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

    private lazy var mainFeedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        return tableView
    }()

    private lazy var mainTableHeaderView: MainHeaderView = {
        let view = MainHeaderView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 450)
        return view
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

        setupViews()
        setupHomeFeedTableView()
        setupNavigationBar()
        setupConstraint()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainFeedTableView.frame = view.bounds
    }
    // MARL: - Setup views

    private func setupViews() {
        view.addSubview(mainFeedTableView)
        mainFeedTableView.tableHeaderView = mainTableHeaderView
    }

    private func setupHomeFeedTableView() {
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(
            CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier
        )
    }

    private func setupConstraint() {
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell()

        }
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
