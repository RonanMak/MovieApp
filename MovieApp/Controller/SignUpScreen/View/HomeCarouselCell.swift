//
//  HomeCarouselCell.swift
//  MovieApp
//
//  Created by Ronan Mak on 20/6/2022.
//

import UIKit

class HomeCarouselCell: UICollectionViewCell {

    // MARK: - SubViews

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.35
        imageView.clipsToBounds = true
        return imageView
    }()

    private let middleText: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.Dimen.largeFontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let middleSubText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.Dimen.mediumFontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - Properties

    static let cellId = "CarouselCell"

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups
private extension HomeCarouselCell {
    func setupUI() {
        addSubview(imageView)
        addSubview(middleText)
        addSubview(middleSubText)

        imageView.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor
        )

        middleText.anchor(left: imageView.leftAnchor,
                          right: imageView.rightAnchor,
                          paddingLeft: Constants.Dimen.padddingLeft,
                          paddingRight: Constants.Dimen.padddingRight
        )
        middleText.centerX(inView: self)
        middleText.centerY(inView: self)

        middleSubText.anchor(
            top: middleText.bottomAnchor,
            left: imageView.leftAnchor,
            right: imageView.rightAnchor,
            paddingTop: Constants.Dimen.padddingTop,
            paddingLeft: Constants.Dimen.padddingTop,
            paddingRight: Constants.Dimen.padddingRight
        )
    }
}

// MARK: - Public
extension HomeCarouselCell {
    func configure(image: UIImage?, middleText: String, middleSubText: String) {
        self.imageView.image = image
        self.middleText.text = middleText
        self.middleSubText.text = middleSubText
    }
}
