//
//  HomeController.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/11/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = TableViewViewModel()
    private let bag = DisposeBag()
    private let menuCellIdentifier = "menuCell"

    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: menuCellIdentifier)
        bindTableView()

    }
    private func bindTableView() {
        viewModel.getList().bind(to: self.tableView.rx.items(cellIdentifier: menuCellIdentifier, cellType: TableViewCell.self)) {
                    (row, element, cell) in
                    cell.itemImage = element.image
                    cell.message = element.message
                }.disposed(by: bag)
    }

}

