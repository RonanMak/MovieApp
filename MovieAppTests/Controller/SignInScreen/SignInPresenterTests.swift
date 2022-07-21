//
//  SignInPresenterTests.swift
//  MovieAppTests
//
//  Created by Ronan Mak on 22/7/2022.
//

@testable import MovieApp
import XCTest
import Foundation

class SignInPresenterTests: XCTestCase {

    var presenter: SignInPresenter!
    var spy: SignInDisplayLogicSpy!

    override func setUp() {
        super.setUp()
        setupSignInPresenter()
    }

    override func tearDown() {
        presenter = nil
        spy = nil
        super.tearDown()
    }

    func setupSignInPresenter() {
        presenter = SignInPresenter()
        spy = SignInDisplayLogicSpy()
        presenter.viewController = spy
    }

    class SignInDisplayLogicSpy: SignInDisplayLogic {

        var isDisplayViewInitCalled = false
        var isDisplayShowPasswordCalled = false
        var isDisplaySignInButtonCalled = false
        var isDisplaySignInCalled = false

        func displayViewInit(viewModel: SignIn.ViewInit.ViewModel) {
            isDisplayViewInitCalled = true
        }

        func displayShowPassword(viewModel: SignIn.ShowPasswordButton.ViewModel) {
            isDisplayShowPasswordCalled = true
        }

        func displaySignInButton(viewModel: SignIn.SignInButton.ViewModel) {
            isDisplaySignInButtonCalled = true
        }

        func displaySignIn(viewModel: SignIn.SignIn.ViewModel) {
            isDisplaySignInCalled = true
        }
    }

    func test_presentViewInit() {
        presenter.presentViewInit()
        XCTAssertTrue(spy.isDisplayViewInitCalled)

    }

    func test_presentShowPassword() {
        presenter.presentShowPassword(response: SignIn.ShowPasswordButton.Response(isSecureTextEntry: true))
        XCTAssertTrue(spy.isDisplayShowPasswordCalled)
    }

    func test_presentSignInButton() {

        let reponse = SignIn.SignInButton.Response(isValid: true)
        presenter.presentSignInButton(response: reponse)

        XCTAssertTrue(spy.isDisplaySignInButtonCalled)
    }

    func test_displaySignIn() {
        let response = SignIn.SignIn.Response(isSignInSuccess: true)
        presenter.presentSignIn(response: response)

        XCTAssertTrue(spy.isDisplaySignInCalled)
    }
}
