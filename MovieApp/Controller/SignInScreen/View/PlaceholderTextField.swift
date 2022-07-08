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

    lazy var floatLabeledTextField: JVFloatLabeledTextField = {
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
        textField.returnKeyType = .default

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
        addSubview(floatLabeledTextField)
        floatLabeledTextField.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingLeft: 20,
            paddingRight: 20,
            height: 48
        )
        floatLabeledTextField.centerY(inView: self)

        floatLabeledTextField.delegate = self
    }
}

extension PlaceholderTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        // return NO to disallow editing.
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        // became first responder

        floatLabeledTextField.backgroundColor = .green
        if let text = textField.text {
            print("\(text)")
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        floatLabeledTextField.backgroundColor = UIColor.AuthPage.inputTextFieldBackgroundColor
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField)
    {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField => textField.text 可取得輸入框的值
//        range => range.location 可取得從第幾個字元開始輸入或複製貼上的 index
//        string => 可取得當下輸入或複製貼上的字串

//        if let text = textField.text {
//            self.delegate?.didReceiveText(text: text)
//        }

        return true
    }
}
