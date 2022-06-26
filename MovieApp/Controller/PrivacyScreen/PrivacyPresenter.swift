//
//  PrivacyPresenter.swift
//  MovieApp
//
//  Created by Ronan Mak on 18/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PrivacyPresentationLogic
{
    func presentViewInit()
}

class PrivacyPresenter
{
    weak var viewController: PrivacyDisplayLogic?
}

extension PrivacyPresenter: PrivacyPresentationLogic {
    func presentViewInit() {
        let viewModel = PrivacyModel.ViewInit.ViewModel(
            navigationTitle: "NETFLIX",
            backButtonIcon: "chevron.backward",
            longString: "You can use our services in a variety of ways to manage your privacy. For example, you can sign up for a Google Account if you want to create and manage content like emails and photos, or see more relevant search results. And you can use many Google services when you’re signed out or without creating an account at all, like searching on Google or watching YouTube videos. You can also choose to browse the web in a private mode, like Chrome Incognito mode. And across our services, you can adjust your privacy settings to control what we collect and how your information is used. You can use our services in a variety of ways to manage your privacy. For example, you can sign up for a Google Account if you want to create and manage content like emails and photos, or see more relevant search results. And you can use many Google services when you’re signed out or without creating an account at all, like searching on Google or watching YouTube videos. You can also choose to browse the web in a private mode, like Chrome Incognito mode. And across our services, you can adjust your privacy settings to control what we collect and how your information is used. You can use our services in a variety of ways to manage your privacy. For example, you can sign up for a Google Account if you want to create and manage content like emails and photos, or see more relevant search results. And you can use many Google services when you’re signed out or without creating an account at all, like searching on Google or watching YouTube videos. You can also choose to browse the web in a private mode, like Chrome Incognito mode. And across our services, you can adjust your privacy settings to control what we collect and how your information is used. You can use our services in a variety of ways to manage your privacy. For example, you can sign up for a Google Account if you want to create and manage content like emails and photos, or see more relevant search results. And you can use many Google services when you’re signed out or without creating an account at all, like searching on Google or watching YouTube videos. You can also choose to browse the web in a private mode, like Chrome Incognito mode. And across our services, you can adjust your privacy settings to control what we collect and how your information is used."
        )
        viewController?.displayViewInit(viewModel: viewModel)
    }
}
