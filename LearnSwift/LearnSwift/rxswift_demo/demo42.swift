//
//  demo42.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/18.
//  Copyright © 2020 jdapple. All rights reserved.
//

import UIKit

class Stu {
    var name: String = ""
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Stu: \(name) -- \(#function)")
    }
}

class WeakControllerView:  UIViewController {
    
    var colurse: ((Int) -> Void)?
    var text: String = "text456"
    var stu: Stu = Stu(name: "tony")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Closure"
        self.view.backgroundColor = .white
//        self.colurse = { [weak self] (a: Int) in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
//                print("\(self?.text ?? "") - \(a)")
//            }
//        }
        
        print(stu.name)
        self.colurse = { [weak self] (a: Int) in
            let str = self?.text ?? ""
            let stu1 = self?.stu ?? Stu(name: "pp")
//            weak var s1 = Stu(name: "")
//            var s2 = Stu(name: "")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                print("\(str) - \(a)")
                print("- \(stu1.name) -")
            }
        }
        
        self.colurse!(5)
        
        print(#function)
    }
    
    deinit {
        print(#function)
    }
    
    
    
}
