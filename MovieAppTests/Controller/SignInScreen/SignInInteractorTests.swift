//
//  SignInInteractorTests.swift
//  MovieAppTests
//
//  Created by Ronan Mak on 21/7/2022.
//

@testable import MovieApp
import XCTest
import Foundation
import Firebase

class SignInInteractorTests: XCTestCase {

    var interactor: SignInInteractor!
    var spy: SignInPresentationLogicSpy!
    var workerSpy: SignInWorkerSpy!

    override func setUp() {
        super.setUp()
        setupSignInInteractor()
    }

    override func tearDown() {
        interactor = nil
        spy = nil
        workerSpy = nil
        super.tearDown()
    }

    func setupSignInInteractor() {
        workerSpy = SignInWorkerSpy()
        interactor = SignInInteractor()
        spy = SignInPresentationLogicSpy()
        interactor.presenter = spy
    }

    class SignInWorkerSpy: SignInWorker {

        override func userSignIn(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        }
    }

    class SignInPresentationLogicSpy: SignInPresentationLogic {

        var isPresentViewInitCalled = false
        var isPresentShowPasswordCalled = false
        var isPresentSignInButtonCalled = false
        var isPresentSignInCalled = false


        func presentViewInit() {
            isPresentViewInitCalled = true
        }

        func presentShowPassword(response: SignIn.ShowPasswordButton.Response) {
            isPresentShowPasswordCalled = true
        }

        func presentSignInButton(response: SignIn.SignInButton.Response) {
            isPresentSignInButtonCalled = true
        }

        func presentSignIn(response: SignIn.SignIn.Response) {
            isPresentSignInCalled = true
        }
    }

    func testRequestViewInit() {
        interactor.requestViewInit()
        XCTAssertTrue(spy.isPresentViewInitCalled, "interactor should call presenter")
    }

    func testRequestShowPassword() {
        interactor.requestShowPassword(request: SignIn.ShowPasswordButton.Request(isSecureTextEntry: true))
        XCTAssertTrue(spy.isPresentShowPasswordCalled)
    }

    func testRequestSignInButton() {
        interactor.requestSignInButton(request: SignIn.SignInButton.Request(email: "", password: ""))
        XCTAssertTrue(spy.isPresentSignInButtonCalled)
    }

    func testRequestSignIn() {

        let expectation = expectation(description: "wait for registation")
        let request = SignIn.SignIn.Request(email: "", password: "")

        interactor.requestSignIn(request: request)

        workerSpy.userSignIn(email: "", password: "") { (result, error) in

//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//                guard let self = self else { return }
                XCTAssertTrue(self.spy.isPresentSignInCalled)
                expectation.fulfill()
//            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
