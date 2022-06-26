//
//  PrivacyModels.swift
//  MovieApp
//
//  Created by Ronan Mak on 18/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum PrivacyModel
{
    enum ViewInit {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            let navigationTitle: String
            let backButtonIcon: String
            let longString: String
        }
    }
}
