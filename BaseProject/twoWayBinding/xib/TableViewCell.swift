//
//  MenuCell.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/11/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    var message : String?
    var itemImage : UIImage?
    
    var messageView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textAlignment = .center
        return textView}()
    
    var itemImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(messageView)
        self.addSubview(itemImageView)
        
        itemImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: self.messageView.topAnchor).isActive = true
        itemImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 250).isActive  = true
        
        messageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            messageView.text = message
        }
        if let image = itemImage {
            itemImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
