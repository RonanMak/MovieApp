//
//  PrivacyInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 18/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PrivacyBusinessLogic
{
    func requestViewInit()
}

protocol PrivacyDataStore
{
    //var name: String { get set }
}

class PrivacyInteractor: PrivacyDataStore
{
    var presenter: PrivacyPresentationLogic?
    var worker: PrivacyWorker?

}

extension PrivacyInteractor: PrivacyBusinessLogic {
    func requestViewInit() {
        presenter?.presentViewInit()
    }
}
