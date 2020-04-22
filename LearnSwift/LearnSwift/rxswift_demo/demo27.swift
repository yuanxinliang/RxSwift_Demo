//
//  demo27.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/16.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct UserViewModel {
    var username = BehaviorRelay(value: "guest")
    
    lazy var userInfo = {
        return self.username.asObservable().map { (str: String) -> String in
            return str == "admin" ? "管理员" : "住户"
        }
    }()
}

// 双向绑定
class Demo27 {
    var bag = DisposeBag()
    func test(_ view: UIView) {
        
        let tf = UITextField(frame: CGRect(x: 40, y: 120, width: 200, height: 50))
        tf.borderStyle = .roundedRect
        view.addSubview(tf)
        
        let label = UILabel(frame: CGRect(x: 40, y: 180, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        
        var vm = UserViewModel()
        
        // 1.普通的双向绑定
//        vm.username.asObservable().bind(to: tf.rx.text).disposed(by: bag)
//        tf.rx.text.orEmpty.asObservable().bind(to: vm.username).disposed(by: bag)
        
        // 2
        _ = tf.rx.textInput <-> vm.username
        
        vm.userInfo.asObservable().bind(to: label.rx.text).disposed(by: bag)
    }
}
