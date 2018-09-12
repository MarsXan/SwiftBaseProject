//
//  TwoWayBindingModel.swift
//  BaseProject
//
//  Created by Mohsen Mokhtari on 9/11/18.
//  Copyright © 2018 Mars. All rights reserved.
//

import Foundation

class PersonModel:  Codable {
    var name: String?
    var lastName: String?
    var age: Int?
    var gender: String?

    init(name: String?, lastName: String?, age: Int, gender: Bool) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.gender = PersonModel.getGender(gender: gender)
    }

    class func getGender(gender: Bool) -> String {
        if gender {
            return "male"
        } else {
            return "female"
        }
    }

}
