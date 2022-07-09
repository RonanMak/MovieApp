//
//  SignUpPresenter.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomePresentationLogic: AnyObject
{
    func presentViewInit()
}

class HomePresenter
{
    weak var viewController: HomeDisplayLogic?
}

extension HomePresenter: HomePresentationLogic {
    func presentViewInit() {
        let logoImage = UIImage(named: "netflix-logo") ?? UIImage()
        let carouselViewData = [
            HomeModel.CarouselData(image: UIImage(named: "netflix-background"),
                                     middleText: "Unlimited movies, TV shows, and more.",
                                     middleSubText: "Watch anywhere. Cancel anytime. Tap the link below to sign up."),
            HomeModel.CarouselData(image: UIImage(named: "black-background"),
                                     middleText: "watch on any device",
                                     middleSubText: "Stream on your phone, tablet, laptop, and TV without paying more."),
            HomeModel.CarouselData(image: UIImage(named: "black-background"),
                                     middleText: "Download and go",
                                     middleSubText: "Save your data. watch offline on a plane, train, or submarine...")
        ]

        let viewModel = HomeModel.ViewInit.ViewModel(
            logoImage: logoImage,
            signUpButtonTitle: "netflix.com/join",
            signInButtonTitle: "Sign In",
            privacyButtonTitle: "Privacy",
            carouselViewData: carouselViewData
        )

        viewController?.displayViewInit(viewModel: viewModel)
    }
}
