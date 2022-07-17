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
        imageView.image = UIImage(named: "obi-wan3")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton().leftImagePlacementButton()
        button.configuration?.title = "Play"
        button.configuration?.image = UIImage(systemName: "play.fill",
                               withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        button.addTarget(self, action: #selector(handlePlayButton), for: .touchUpInside)
        return button
    }()

    private lazy var myListButton: UIButton = {
        let button = UIButton().topImagePlacementButton()
        button.configuration?.title = "My List"
        button.configuration?.image = UIImage(systemName: "plus",
                               withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        button.addTarget(self, action: #selector(handleMyList), for: .touchUpInside)
        return button
    }()

    private lazy var infoButton: UIButton = {
        let button = UIButton().topImagePlacementButton()
        button.configuration?.title = "Info"
        button.configuration?.image = UIImage(systemName: "info.circle",
                               withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
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
        addSubview(myListButton)
        addSubview(infoButton)
    }

    func setupConstraint() {
        mainHeaderImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)

        playButton.anchor(bottom: bottomAnchor, paddingBottom: 50, width: 76, height: 24)
        playButton.centerX(inView: self)

        myListButton.anchor(left: leftAnchor, paddingLeft: 50, width: 70, height: 70)
        myListButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true

        infoButton.anchor(right: rightAnchor, paddingRight: 50, width: 70, height: 70)
        infoButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
    }

    private func addGradient() {
        let colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
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

    @objc func handleMyList() {
        print("sdjiosajoi123123")
    }

    @objc func handleInfo() {

    }
}
