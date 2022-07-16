//
//  DownloadScreenInteractor.swift
//  MovieApp
//
//  Created by Ronan Mak on 16/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DownloadScreenBusinessLogic
{
//    func doSomething(request: DownloadScreen.Something.Request)
}

protocol DownloadScreenDataStore
{
    //var name: String { get set }
}

class DownloadScreenInteractor: DownloadScreenBusinessLogic, DownloadScreenDataStore
{
    var presenter: DownloadScreenPresentationLogic?
    var worker: DownloadScreenWorker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: DownloadScreen.Something.Request)
//    {
//        worker = DownloadScreenWorker()
//        worker?.doSomeWork()
//
//        let response = DownloadScreen.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
