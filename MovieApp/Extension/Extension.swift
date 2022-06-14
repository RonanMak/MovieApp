//
//  Extension.swift
//  MovieApp
//
//  Created by Ronan Mak on 15/6/2022.
//

import UIKit

extension UIButton {
    func signUpButton(withText text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        return button
    }
}
