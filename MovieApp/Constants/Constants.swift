//
//  Constants.swift
//  MovieApp
//
//  Created by Ronan Mak on 1/7/2022.
//

import UIKit

enum Constants {

    enum Tabbar {
        static let home = "Home"
        static let new = "New & Hot"
        static let search = "Search"
        static let download = "Download"
    }

    enum Dimen {
        // basic padding
        static let defaultPaddding: CGFloat = 20
        static let padddingLeft: CGFloat = 20
        static let padddingRight: CGFloat = 20
        static let padddingBottom: CGFloat = 20
        static let padddingTop: CGFloat = 20

        // text
        static let largeFontSize: CGFloat = 35
        static let mediumFontSize: CGFloat = 25
        static let smallFontSize: CGFloat = 20

        // logo
        static let logoWidth: CGFloat = 90
        static let logohHeight: CGFloat = 25

        // homeCarouselView page number
        static let pageNumner: Int = 3

        static let commonAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .bold),
            NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray
        ]

        // button height
        static let buttonHeight: CGFloat = 48
    }

    enum RegularExpression {
        static let passwordPattern =
        // At least 8 characters
        #"(?=.{6,})"#

        // At least one capital letter
//        #"(?=.*[A-Z])"#

        // At least one lowercase letter
//        #"(?=.*[a-z])"# +

        // At least one digit
//        #"(?=.*\d)"# +

        // At least one special character
//        #"(?=.*[ !$%&?._-])"#

        static let emailPattern = #"^\S+@\S+\.\S+$"#
    }
}
