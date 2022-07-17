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

        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        let navigationBarHeight: CGFloat = navigationController?.navigationBar.frame.height ?? 0
        
        mainFeedTableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -(navigationBarHeight + height))
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

    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Setup navigation bar

    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)

        let navigationBarAppearance = UINavigationBarAppearance()
        
        // background color
        navigationBarAppearance.configureWithTransparentBackground()

        // title color
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance

        navigationItem.title = "dkfjsdjkfhl"
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset ))

    }
}
