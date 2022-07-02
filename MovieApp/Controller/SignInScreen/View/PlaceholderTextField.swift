//
//  PlaceholderTextField.swift
//  MovieApp
//
//  Created by Ronan Mak on 25/6/2022.
//

import UIKit
import JVFloatLabeledTextField

protocol PlaceholderTextFieldDelegate: AnyObject {
    func textFeildPassworButtonDidPress()
}

class PlaceholderTextField: UIView {

    // MARK: - Properties
    var isPasswordShown: Bool = false

    lazy var jTextField: JVFloatLabeledTextField = {
        let textField = JVFloatLabeledTextField()
        textField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
        textField.placeholderColor = .lightGray
        textField.floatingLabelActiveTextColor = .lightGray
        textField.floatingLabelYPadding = 5
        textField.textColor = .lightGray
        textField.layer.cornerRadius = 5
        textField.delegate = self

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

        jTextField.anchor(top: topAnchor, bottom: bottomAnchor ,left: leftAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20, height: 48)
        jTextField.centerY(inView: self)
    }

    func configAttributedText() {

    }
}

extension PlaceholderTextField: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        jTextField.backgroundColor = UIColor.AuthPage.inputTextFieldBeginEditing
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        jTextField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
        print("TextField did end editing method called\(textField.text!)")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        /*
         textField => textField.text 可取得輸入框的值
         range => range.location 可取得從第幾個字元開始輸入或複製貼上的 index
         string => 可取得當下輸入或複製貼上的字串
         */
        return true
    }
}

