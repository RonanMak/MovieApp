//
//  SearchScreenInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchScreenBusinessLogic
{
//    func doSomething(request: SearchScreen.Something.Request)
}

protocol SearchScreenDataStore
{
    //var name: String { get set }
}

class SearchScreenInteractor: SearchScreenBusinessLogic, SearchScreenDataStore
{
    var presenter: SearchScreenPresentationLogic?
    var worker: SearchScreenWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: SearchScreen.Something.Request)
//    {
//        worker = SearchScreenWorker()
//        worker?.doSomeWork()
//
//        let response = SearchScreen.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
