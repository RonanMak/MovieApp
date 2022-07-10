//
//  MainInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainBusinessLogic
{
//    func doSomething(request: Home.Something.Request)
}

protocol MainDataStore
{
    //var name: String { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore
{
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: Home.Something.Request)
//    {
//        worker = HomeWorker()
//        worker?.doSomeWork()
//
//        let response = Home.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
