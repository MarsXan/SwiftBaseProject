//
//  ViewController.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/7/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SimpleController: UIViewController {
    @IBOutlet weak var nameLbl: UITextField!
     private let bag = DisposeBag()
    @IBOutlet weak var lastNameLbl: UITextField!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var resultTv: UITextView!
    let viewModel = SimpleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindVIewModel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func bindVIewModel(){
        nameLbl.rx.text.orEmpty.bind(to: viewModel.name).disposed(by: bag)
        lastNameLbl.rx.text.orEmpty.bind(to: viewModel.lastName).disposed(by: bag)
        genderSwitch.rx.value.bind(to: viewModel.gender).disposed(by: bag)
        ageSlider.rx.value.bind(to: viewModel.age).disposed(by: bag)
        self.viewModel.getPerson().bind(to:self.resultTv.rx.text).disposed(by:self.bag)
    }
    

}

