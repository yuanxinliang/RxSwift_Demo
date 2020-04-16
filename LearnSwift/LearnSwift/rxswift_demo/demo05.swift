//
//  demo4.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Demo5 {
    var bag = DisposeBag()
    func test() {
        
        // 1.1 直接在 subscribe 方法中创建观察者
        Observable<Int>.just(5).subscribe { (event: Event<Int>) in
            print(event)
        }.disposed(by: bag)
        
        // 1.2 直接在 bind 方法中创建观察者
        let ob = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        ob.map { (num) -> String in
            return "索引为gg：\(num)"
        }.bind { (text) in
            print(text)
        }.disposed(by: bag)
        
        // 2. 使用 AnyObserver 创建观察者
        let ob1: AnyObserver<String> = AnyObserver { (event) in
            switch event {
            case .next(let data):
                print(data)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
        
        // 2.1 观察者，配合 subscribe 方法使用
        Observable.from(["1", "3"]).subscribe(ob1).disposed(by: bag)
        
        // 2.2 观察者，配合 bind 方法使用
        let oba1 = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        oba1.map { (num) -> String in
            return "索引为：\(num)"
        }.bind(to: ob1)
        .disposed(by: bag)
        
        // 3. 使用 Binder 创建观察者
        let label = UILabel()
        let binder: Binder<String> = Binder(label) { (label, text) in
            label.text = text
            print("binder: \(text)")
        }
        Observable.just("a").bind(to: binder).disposed(by: bag)
    }
}
