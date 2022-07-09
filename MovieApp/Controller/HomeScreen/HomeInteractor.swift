//
//  SignUpInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic: AnyObject
{
    func requestViewInit()
}

protocol HomeDataStore
{
    //var name: String { get set }
}

class HomeInteractor: HomeDataStore
{
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
}

extension HomeInteractor: HomeBusinessLogic {
    func requestViewInit() {
        presenter?.presentViewInit()
    }
}
