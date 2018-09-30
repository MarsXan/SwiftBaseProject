//
//  SwipingController.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/16/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SwipingController: UIViewController ,UICollectionViewDelegate{
    private let cellIdentifier = "myCellID"
    private var collectionView: UICollectionView? = nil
    private let viewModel = SwipingVM()
    private let bag = DisposeBag()
    private var pageCount = 0

    private var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button

    }()

    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Colors.pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button

    }()

    private lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = self.pageCount
        pc.currentPageIndicatorTintColor = Colors.pinkColor
        pc.pageIndicatorTintColor = Colors.pinkColorT
        return pc
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)

        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.register(SwipingPageCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true

        self.view.addSubview(collectionView!)
        bindCollectionView()
        setupButtonControls()

    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x,view.frame.width)
        pageController.currentPage = Int(x / view.frame.width)
        targetContentOffset.pointee = scrollView.contentOffset
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.collectionView?.frame = self.view.frame
            self.collectionView?.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

         }, completion:
        {_ in })

    }


    @objc private func handleNext() {
        let nextIndex = min(pageController.currentPage+1, pageCount-1)
        let indexPath = IndexPath(item:nextIndex,section: 0)
        pageController.currentPage = nextIndex
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)


    }
    @objc private func handlePrevious() {
        let nextIndex = max(pageController.currentPage-1, 0)
        let indexPath = IndexPath(item:nextIndex,section: 0)
        pageController.currentPage = nextIndex
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)


    }


    private func bindCollectionView() {
        viewModel.getPages()
                .do(onNext: { pages in self.pageCount = pages != nil ? pages.count : 0})
                .bind(to: (self.collectionView?.rx.items(cellIdentifier: cellIdentifier, cellType: SwipingPageCell.self))!) {
                    (row, element, cell) in
                    cell.page = element
                }.disposed(by: bag);

        self.collectionView?.rx.setDelegate(self).disposed(by: bag)
    }

    private func setupButtonControls() {
        let controlStackView = UIStackView(arrangedSubviews: [previousButton, pageController, nextButton])
        view.addSubview(controlStackView)
        controlStackView.translatesAutoresizingMaskIntoConstraints = false
        controlStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            controlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controlStackView.heightAnchor.constraint(equalToConstant: 50),
            controlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }
}
