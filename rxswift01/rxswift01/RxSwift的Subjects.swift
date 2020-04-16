//
//  RxSwift的Subjects.swift
//  rxswift01
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

/**
 *subjects是什么？
 *subject是obserable和observer之间的桥梁；
 *一个subject既是一个observerable也是一个observer；
 *它既可以发送事件，也可以监听事件。
 *
 *1.PublishSubject：订阅者只能接受到订阅之后发送的事件；
 *2.ReplaySubject：订阅者能接受订阅前后发送的事件；
 *3.BehaviorSubject：订阅者能接受订阅之前最后一个发送的事件，和订阅之后所有发送的事件；
 *4.Variable：已废弃
 */

extension ViewController {
    
    func rxSwift_subjects() {
        // 1.PublishSubject
        print("------------PublishSubject-------------")
        let publish = PublishSubject<String>()
        publish.onNext("a")
        publish.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        publish.onNext("b")
        publish.onNext("c")
        
        // 2.ReplaySubject
        print("------------ReplaySubject-------------")
        let replay = ReplaySubject<String>.createUnbounded()
        replay.onNext("a")
        replay.onNext("b")
        replay.onNext("c")
        replay.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        replay.onNext("e")
        replay.onNext("f")
        
        // 3.BehaviorSubject
        print("------------BehaviorSubject-------------")
        let behavior = BehaviorSubject(value: "a")
        behavior.onNext("b")
        behavior.onNext("c")
        behavior.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        behavior.onNext("d")
        behavior.onNext("e")
        
        // 4.Variable
        /**
         *Variable
         *1>相当于对BehaviorSubject进行装箱
         *2>订阅时（监听事件）：需要间Variable转换为
         *3>发出时（发出事件）：直接调用value
         *4>结束时：Variable会自动发出complete事件
         */
        // "Variable is deprecated. Please use `BehaviorRelay` as a replacement."
        // let variable = Variable
        
    }
}
