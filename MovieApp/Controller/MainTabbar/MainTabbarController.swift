//
//  MainTabbarController.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barStyle = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .black

        let mainController = MainConfigurator.createScene()
        mainController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.home, image: UIImage(systemName: "house"), tag: 0)
        let mainNavigationController = UINavigationController(rootViewController: mainController)

        let newController = NewScreenConfigurator.createScene()
        newController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.new, image: UIImage(systemName: "play.rectangle.on.rectangle.fill"), tag: 1)

        let searchController = SearchScreenConfigurator.createScene()
        searchController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.search, image: UIImage(systemName: "magnifyingglass"), tag: 2)

        let downloadController = DownloadScreenConfigurator.createScene()
        downloadController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.download, image: UIImage(systemName: "arrow.down.circle.fill"), tag: 3)

        let tabBarList = [mainNavigationController, newController, searchController, downloadController]
        viewControllers = tabBarList
    }
}
