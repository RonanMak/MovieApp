//
//  NewScreenInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewScreenBusinessLogic
{
//    func doSomething(request: NewScreen.Something.Request)
}

protocol NewScreenDataStore
{
    //var name: String { get set }
}

class NewScreenInteractor: NewScreenBusinessLogic, NewScreenDataStore
{
    var presenter: NewScreenPresentationLogic?
    var worker: NewScreenWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: NewScreen.Something.Request)
//    {
//        worker = NewScreenWorker()
//        worker?.doSomeWork()
//
//        let response = NewScreen.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
