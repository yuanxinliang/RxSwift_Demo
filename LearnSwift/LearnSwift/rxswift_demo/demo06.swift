//
//  demo06.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// 自定义可绑定属性
class Demo6 {
    var bag = DisposeBag()
    func test() {
        
        let label = UILabel(frame: CGRect(x: 40, y: 100, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        let vc = UIApplication.shared.keyWindow?.rootViewController
        vc?.view.addSubview(label)
        
        Observable.just("a").bind(to: label.fontSize).disposed(by: bag)
        
        let interval = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        
        interval.map { CGFloat($0) }.bind(to: label.rx.fontSize).disposed(by: bag)
        
        
    }
}

// 方式一：通过对 UI 类进行扩展
extension UILabel {
    public var fontSize: Binder<String> {
        return Binder(self) { (label, text) in
            label.text = text
        }
    }
}

// 方式二：通过对 Reactive 类进行扩展
extension Reactive where Base: UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self.base) { (label, value) in
            label.font = UIFont.systemFont(ofSize: value)
        }
    }
}
