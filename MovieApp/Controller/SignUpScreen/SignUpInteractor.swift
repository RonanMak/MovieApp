//
//  SignUpInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignUpBusinessLogic: AnyObject
{
    func requestViewInit()
}

protocol SignUpDataStore
{
    //var name: String { get set }
}

class SignUpInteractor: SignUpDataStore
{
    var presenter: SignUpPresentationLogic?
    var worker: SignUpWorker?
}

extension SignUpInteractor: SignUpBusinessLogic {
    func requestViewInit() {
        presenter?.presentViewInit()
    }
}
