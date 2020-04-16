//
//  ViewController.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let demo5 = Demo5()
    let demo6 = Demo6()
    let demo21 = Demo21()
    let demo22 = Demo22()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        demo5.test()
//        demo6.test()
//        Demo7().test()
//        demo21.test(view)
        demo22.test(view)
    }

}

