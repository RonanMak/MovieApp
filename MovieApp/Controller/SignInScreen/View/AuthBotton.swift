//
//  AuthBotton.swift
//  MovieApp
//
//  Created by Ronan Mak on 26/6/2022.
//

import UIKit

class AuthButton: UIView {

    // MARK: - Properties
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 19, green: 19, blue: 19)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.rgb(red: 1, green: 1, blue: 1)
        return view
    }()

    lazy var authAttributedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.rgb(red: 194, green: 194, blue: 194), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(containerView)
        addSubview(authAttributedButton)

        containerView.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingLeft: 20,
            paddingRight: 20,
            height: 48
        )
        
        containerView.centerYAnchor(view: self)

        authAttributedButton.anchor(
            top: containerView.topAnchor,
            bottom: containerView.bottomAnchor,
            left: containerView.leftAnchor,
            right: containerView.rightAnchor
        )
    }
}
