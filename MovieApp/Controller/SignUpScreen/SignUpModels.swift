//
//  SignUpModels.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SignUpModel
{
    enum ViewInit {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            let logoImage: UIImage
            let signUpButtonTitle: String
            let signInButtonTitle: String
            let privacyButtonTitle: String
            let carouselViewData: [CarouselData]
            let homeCarouselpageNumber: Int
        }
    }

    struct CarouselData {
        let image: UIImage?
        let middleText: String
        let middleSubText: String
    }
}
