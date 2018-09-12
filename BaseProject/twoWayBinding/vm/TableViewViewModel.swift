//
//  TableViewViewModel.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/11/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import Foundation
import RxSwift

class TableViewViewModel {
    var menuList = Variable<[TableViewModel]>([TableViewModel(image: #imageLiteral(resourceName: "myImage"),message: "How to make a portal!"),TableViewModel(image: #imageLiteral(resourceName: "myImage"),message: "How to make a portal!"),TableViewModel(image: #imageLiteral(resourceName: "myImage"),message: "How to make a portal!"),TableViewModel(image: #imageLiteral(resourceName: "myImage"),message: "How to make a portal!")])
    
    
    func getList() -> Observable<[TableViewModel]> {
        return menuList.asObservable()
            .filter{list in list.count>0}
    }
    
    
}
