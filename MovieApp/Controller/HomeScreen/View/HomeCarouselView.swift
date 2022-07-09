//
//  HomeCarouselView.swift
//  MovieApp
//
//  Created by Ronan Mak on 20/6/2022.
//

import UIKit

class HomeCarouselView: UIView {

    // MARK: - Subviews

    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        // We also have to limit the scrolling to only one cell at a time.
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.register(HomeCarouselCell.self, forCellWithReuseIdentifier: HomeCarouselCell.cellId)
        collection.backgroundColor = .clear

        let carouselLayout = UICollectionViewFlowLayout()
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        carouselLayout.itemSize = .init(width: screenWidth, height: screenHeight)
        carouselLayout.minimumInteritemSpacing = 0
        carouselLayout.minimumLineSpacing = 0
        carouselLayout.scrollDirection = .horizontal
        collection.collectionViewLayout = carouselLayout

        return collection
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()

    // MARK: - Properties
    private var carouselData = [HomeModel.CarouselData]()
    private var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }

    // MARK: - Initializers

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeCarouselView {
    func setupUI() {
        setupCollectionView()
        setupPageControl()
    }

    func setupCollectionView() {
        addSubview(carouselCollectionView)
        carouselCollectionView.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor
        )
    }

    func setupPageControl() {
        addSubview(pageControl)
        pageControl.anchor(
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            paddingBottom: 80,
            width: 150,
            height: 50
        )
        pageControl.centerX(inView: self)
//        pageControl.numberOfPages = pages
    }
}

// MARK: - UICollectionViewDataSource
extension HomeCarouselView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCarouselCell.cellId, for: indexPath) as? HomeCarouselCell else { return UICollectionViewCell() }

        let data = carouselData[indexPath.row]
        let image = data.image
        let middleText = data.middleText
        let middleSubText = data.middleSubText

        cell.configure(image: image, middleText: middleText, middleSubText: middleSubText)

        return cell
    }
}

// MARK: - UICollectionView Delegate
extension HomeCarouselView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}

// MARK: - configure HomeCarouselView
extension HomeCarouselView {
    func configureView(with data: [HomeModel.CarouselData]) {
        pageControl.numberOfPages = data.count
        self.carouselData = data
        self.carouselCollectionView.reloadData()

    }
}

// MARK: - Helpers
private extension HomeCarouselView {
    func getCurrentPage() -> Int {
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size )
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }

        return currentPage
    }
}
