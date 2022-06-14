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
//    func doSomething(request: SignUp.Something.Request)
}

protocol SignUpDataStore
{
    //var name: String { get set }
}

class SignUpInteractor: SignUpBusinessLogic, SignUpDataStore
{
    var presenter: SignUpPresentationLogic?
    var worker: SignUpWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: SignUp.Something.Request)
//    {
//        worker = SignUpWorker()
//        worker?.doSomeWork()
//
//        let response = SignUp.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
