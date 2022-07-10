//
//  Helper.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//

import UIKit

public enum Helper {

    enum Auth {
        
        static func emailAndPasswordChecking(email: String, password: String) -> Bool {
            var isValid: Bool = false

            // is valid email?
            let emailResult = email.range(
                of: Constants.RegularExpression.emailPattern,
                options: .regularExpression
            )
            let isValidEmail = (emailResult != nil)

            // is valid password?
            let passwordResult = password.range(
                of: Constants.RegularExpression.passwordPattern,
                options: .regularExpression
            )
            let isValidPassword = (passwordResult != nil)

            isValid = isValidEmail && isValidPassword ? true : false

            return isValid
        }
    }

    enum Alert {

        static func showAlert(viewController: UIViewController, title: String?, message: String?) {
            guard let title = title, let message = message else { return }
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                viewController.present(alert, animated: true)
            }
        }
    }
}
