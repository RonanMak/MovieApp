//
//  SignInInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInBusinessLogic
{
    func requestViewInit()
    func requestShowPasswordButtonDidPress()
}

protocol SignInDataStore
{
    //var name: String { get set }
}

class SignInInteractor: SignInDataStore
{
    var presenter: SignInPresentationLogic?
    var worker: SignInWorker?

}

extension SignInInteractor: SignInBusinessLogic {

    func requestViewInit() {
        presenter?.presentViewInit()
    }

    func requestShowPasswordButtonDidPress() {
        
    }
}
