//
//  HomeCarouselCell.swift
//  MovieApp
//
//  Created by Ronan Mak on 20/6/2022.
//

import UIKit

class HomeCarouselCell: UICollectionViewCell {

    // MARK: - Style

    enum Dimen {
        // basic style
        static let defaultMargin: CGFloat = 20
        static let marginLeft: CGFloat = 20
        static let marginRight: CGFloat = 20
        static let marginBottom: CGFloat = 20
        static let marginTop: CGFloat = 20

        // middleText
        static let fontSize: CGFloat = 35

        // middleSubText
        static let subTextFontSize: CGFloat = 20
    }

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
        label.font = UIFont.boldSystemFont(ofSize: Dimen.fontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let middleSubText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Dimen.subTextFontSize)
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
                          paddingLeft: Dimen.marginLeft,
                          paddingRight: Dimen.marginRight
        )
        middleText.centerXAndYAnchor(view: imageView)

        middleSubText.anchor(
            top: middleText.bottomAnchor,
            left: imageView.leftAnchor,
            right: imageView.rightAnchor,
            paddingTop: Dimen.marginTop,
            paddingLeft: Dimen.marginLeft,
            paddingRight: Dimen.marginRight
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
