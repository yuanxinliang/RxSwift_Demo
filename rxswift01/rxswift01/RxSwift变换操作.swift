//
//  RxSwift变换操作.swift
//  rxswift01
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

extension ViewController {
    
    func rxSwift_map() {
        // map
        let arr = [1, 2, 3, 4, 5]
        let arr1 = arr.map { (num: Int) -> Int in
            return num * num
        }
        print(arr1)
        Observable.from([1, 2, 3]).map { (num: Int) -> Int in
            return num * 3
        }.subscribe { (event: Event<Int>) in
            print(event)
        }.disposed(by: bag)
    }
}
