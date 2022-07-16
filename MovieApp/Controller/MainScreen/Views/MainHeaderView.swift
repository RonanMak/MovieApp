//
//  mainHeaderView.swift
//  MovieApp
//
//  Created by Ronan Mak on 16/7/2022.
//

import UIKit

class MainHeaderView: UIView {

    private lazy var mainHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "obi-wan")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton()

        var config = UIButton.Configuration.filled()
        config.title = "Play"
        config.titleAlignment = .center
        config.titlePadding = 10.0
        config.baseForegroundColor = .black
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
           }

        config.background.backgroundColor = .white

        config.image = UIImage(systemName: "play.fill",
                               withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        config.imagePlacement = .leading
        config.imagePadding = 10

        config.background.cornerRadius = 3

        button.configuration = config

        button.addTarget(self, action: #selector(handlePlayButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraint()
    }

    func setupViews() {
        addSubview(mainHeaderImageView)
        addGradient()
        addSubview(playButton)
    }

    func setupConstraint() {
        mainHeaderImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)

        playButton.anchor(bottom: bottomAnchor, paddingBottom: 50, width: 76, height: 24)
        playButton.centerX(inView: self)
    }

    private func addGradient() {
        let colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    // MARK: - Actions

    @objc func handlePlayButton() {
        print("jhijhi")
    }
}
