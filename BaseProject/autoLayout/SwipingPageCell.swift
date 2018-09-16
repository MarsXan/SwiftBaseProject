//
//  SwipingPageCell.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/16/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import UIKit

class SwipingPageCell: UICollectionViewCell {

    var page: Page? {
        didSet {
            guard page != nil && page?.imageName != nil && page?.title != nil else {
                return
            }
            mImageView.image = UIImage(named: page!.imageName!)

            let attributedText = NSMutableAttributedString(string: page!.title!, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(page!.body!)",
                    attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))

            mTextView.attributedText = attributedText
            mTextView.textAlignment = .center
        }
    }

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
    private var mTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topContainer)
        addSubview(bottomContainer)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        //topContainer
        topContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true //leftAnchor
        topContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true //rightAnchor
        topContainer.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        topContainer.addSubview(mImageView)
        mImageView.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.6).isActive = true
        mImageView.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        mImageView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true


        //bottomCOntainer
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bottomContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomContainer.addSubview(mTextView)
        mTextView.leftAnchor.constraint(equalTo: bottomContainer.leftAnchor, constant: 16).isActive = true
        mTextView.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor, constant: -16).isActive = true
        mTextView.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0).isActive = true
        mTextView.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
    }



}
