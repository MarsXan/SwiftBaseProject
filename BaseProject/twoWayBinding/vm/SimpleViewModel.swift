//
//  twoWayBindingViewModel.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/11/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import Foundation
import RxSwift

final class SimpleViewModel {
    let name = Variable<String>("")
    var lastName = Variable<String>("")
    var age = Variable<Float>(0)
    var gender = Variable<Bool>(false)
    var model: PersonModel?


    func getName() -> Observable<String> {
        return name
                .asObservable()
                .filter { name in
                    name.count > 0
                }
                .map { name in
                    return "My Name is : \(name)"
                }
    }

    func getPerson() -> Observable<String> {
        return Observable.combineLatest(name.asObservable(), lastName.asObservable(), age.asObservable(), gender.asObservable()) {
                    ($0, $1, $2, $3)
                }
                .asObservable()
                .debounce(0.2, scheduler: MainScheduler.instance)
                .do(onNext: { self.model = PersonModel(name: $0.0,lastName: $0.1,age: Int($0.2),gender: $0.3) })
                .map { cObject in
                    return "Name : \(cObject.0)\nLastName : \(cObject.1)\nage : \(Int(cObject.2))\ngender : \(PersonModel.getGender(gender: cObject.3))"
                }
    }



}
