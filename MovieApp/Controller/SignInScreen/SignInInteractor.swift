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
//    func doSomething(request: SignIn.Something.Request)
}

protocol SignInDataStore
{
    //var name: String { get set }
}

class SignInInteractor: SignInBusinessLogic, SignInDataStore
{
    var presenter: SignInPresentationLogic?
    var worker: SignInWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: SignIn.Something.Request)
//    {
//        worker = SignInWorker()
//        worker?.doSomeWork()
//
//        let response = SignIn.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
