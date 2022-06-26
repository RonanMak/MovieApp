//
//  Extension.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//

import UIKit

public struct AnchoredConstraints {
    public var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

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

    func centerXAndYAnchor(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func centerXAnchor(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }

    func centerYAnchor(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, left: superview?.leftAnchor, right: superview?.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    enum AuthPage {
        static let inputTextFieldBackgroundColor = UIColor.rgb(red: 51, green: 51, blue: 51)
        static let inputTextFieldTextColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        static let inputTextFieldPlaceholderColor = UIColor.rgb(red: 188, green: 188, blue: 188)
        static let inputTextFieldBeginEditing = UIColor.rgb(red: 40, green: 40, blue: 40)
        static let authPageBackgroundColor = UIColor.rgb(red: 19, green: 19, blue: 19)

    }
}

extension CGColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor {
        return CGColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

}
