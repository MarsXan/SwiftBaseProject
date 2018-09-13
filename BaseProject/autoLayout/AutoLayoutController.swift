//
//  AutoLayoutController.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/13/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import Foundation
import UIKit

class AutoLayoutController: UIViewController {


    private var mImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var bottomContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = Colors.pinkColor
        pc.pageIndicatorTintColor = Colors.pinkColorT
        return pc
    }()

    private var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button

    }()

    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Colors.pinkColor, for: .normal)
        return button

    }()


    private var mTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "This a Sample Text", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nThis is my second line of text view with custom attribute", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topContainer)
        view.addSubview(bottomContainer)
        setupLayout()
        setupButtonControls()
    }

    private func setupButtonControls() {
        let controlStackView = UIStackView(arrangedSubviews: [previousButton, pageController, nextButton])
        bottomContainer.addSubview(controlStackView)
        controlStackView.translatesAutoresizingMaskIntoConstraints = false
        controlStackView.distribution = .fillEqually


        NSLayoutConstraint.activate([
            controlStackView.bottomAnchor.constraint(equalTo: bottomContainer.safeAreaLayoutGuide.bottomAnchor),
            controlStackView.leadingAnchor.constraint(equalTo: bottomContainer.safeAreaLayoutGuide.leadingAnchor),
            controlStackView.heightAnchor.constraint(equalToConstant: 50),
            controlStackView.trailingAnchor.constraint(equalTo: bottomContainer.safeAreaLayoutGuide.trailingAnchor),

        ])


    }

    private func setupLayout() {

        //topContainer
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true //leftAnchor
        topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true //rightAnchor
        topContainer.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        topContainer.addSubview(mImageView)
        mImageView.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.6).isActive = true
        mImageView.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        mImageView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true


        //bottomCOntainer
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bottomContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomContainer.addSubview(mTextView)
        mTextView.leftAnchor.constraint(equalTo: bottomContainer.leftAnchor, constant: 16).isActive = true
        mTextView.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor, constant: -16).isActive = true
        mTextView.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0).isActive = true
        mTextView.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
    }
}
