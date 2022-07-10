//
//  Extension.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//

import UIKit
import JVFloatLabeledTextField

// MARK: - UIButton

extension UIButton {
    func signUpButton(withText text: String?) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(white: 1, alpha: 0.78), for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        return button
    }

    func attributesButton(text: String?) -> UIButton {
        let button = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(string: text ?? "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }

    func authButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.rgb(red: 194, green: 194, blue: 194), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = CGColor.rgb(red: 1, green: 1, blue: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }
}

// MARK: - JVFloatLabeledTextField

extension JVFloatLabeledTextField {
    func customfloatLabeledTextField(withText text: String?) -> JVFloatLabeledTextField {
        let textField = JVFloatLabeledTextField()
        textField.backgroundColor = UIColor.AuthPage.JVFTextFieldBgColor
        textField.placeholderColor = .lightGray
        textField.floatingLabelActiveTextColor = .lightGray
        textField.floatingLabelYPadding = 5
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
//        textField.becomeFirstResponder()
        textField.textColor = .lightGray
        textField.layer.cornerRadius = 5
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true

        textField.leftView = view
        textField.leftViewMode = .always
        return textField
    }
}

//MARK: - UIView

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true

        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }

    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.45
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
}

// MARK: - UIColor

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    enum AuthPage {
        static let JVFTextFieldBgColor = UIColor.rgb(red: 51, green: 51, blue: 51)
        static let JVFTextFieldBeginEditing = UIColor.rgb(red: 40, green: 40, blue: 40)
        static let signInPageBackgroundColor = UIColor.rgb(red: 19, green: 19, blue: 19)
        static let netflixRed = UIColor.rgb(red: 228, green: 10, blue: 19)
    }
}

// MARK: - CGColor

extension CGColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor {
        return CGColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}

// MARK: - UIViewController

extension UIViewController {
    @objc func keyboardShow(_ notification: Notification) {
        //從userInfo中取得鍵盤的frame -> size
        let userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let intersection = keyboardSize.intersection(view.frame)

        view.frame.size = CGSize(width: view.frame.width, height: view.frame.height - intersection.height + 150)
    }

    @objc func keyboardHide(_ notification: Notification) {
        view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}
