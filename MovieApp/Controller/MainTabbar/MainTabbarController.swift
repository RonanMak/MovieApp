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

        self.tabBar.barStyle = .black
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.isTranslucent = false

        let homeController = HomeConfigurator.createScene()
        homeController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.home, image: UIImage(systemName: "house"), tag: 0)

        let NewController = NewScreenConfigurator.createScene()
        NewController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.new, image: UIImage(systemName: "play.rectangle.on.rectangle.fill"), tag: 1)

        let SearchController = SearchScreenConfigurator.createScene()
        SearchController.tabBarItem = UITabBarItem.init(title: Constants.Tabbar.search, image: UIImage(systemName: "magnifyingglass"), tag: 2)

        let tabBarList = [homeController, NewController, SearchController]
        viewControllers = tabBarList
    }
}
