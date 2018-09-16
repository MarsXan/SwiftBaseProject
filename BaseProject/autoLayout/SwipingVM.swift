//
// Created by Mohsen Mokhtari on 9/16/18.
// Copyright (c) 2018 Mars. All rights reserved.
//

import Foundation
import RxSwift

class SwipingVM {
    var pages = Variable<[Page]>([Page(id: 0,imageName: "bear_first", title: "Bear", body: "bears are carnivoran mammals of the family Ursidae.")
                                  , Page(id: 1,imageName: "heart_second", title: "Heart", body: "the heart is a muscular organ in most animals")
                                  , Page(id: 2,imageName: "leaf_third", title: "Leaf", body: "a leaf is an organ of a vascular plant and is the principal lateral appendage of the stem.")])



    func getPages() -> Observable<[Page]> {
        return pages.asObservable()
    }

}