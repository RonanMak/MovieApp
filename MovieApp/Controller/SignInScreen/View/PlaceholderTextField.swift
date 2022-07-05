//
//  PlaceholderTextField.swift
//  MovieApp
//
//  Created by Ronan Mak on 25/6/2022.
//

import UIKit
import JVFloatLabeledTextField

class PlaceholderTextField: UIView {

    // MARK: - Properties

    lazy var jTextField: JVFloatLabeledTextField = {
        let textField = JVFloatLabeledTextField()
        textField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
        textField.placeholderColor = .lightGray
        textField.floatingLabelActiveTextColor = .lightGray
        textField.floatingLabelYPadding = 5
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
//        textField.becomeFirstResponder()
        textField.textColor = .lightGray
        textField.layer.cornerRadius = 5

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true

        textField.leftView = view
        textField.leftViewMode = .always
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(jTextField)
        jTextField.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingLeft: 20,
            paddingRight: 20,
            height: 48
        )
        jTextField.centerY(inView: self)
    }
}
