//
//  demo07.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// Subjects 介绍
class Demo7 {
    
    var bag = DisposeBag()
    
    func test() {
        // PublicSubject
        print("-------PublicSubject")
        let pubSubject = PublishSubject<String>()
        pubSubject.onNext("a")
        pubSubject.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        pubSubject.onNext("b")
        
        // BehaviorSubject
        print("-------BehaviorSubject")
        let behaSubject = BehaviorSubject<String>(value: "aaa")
        behaSubject.onNext("bbb")
        behaSubject.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        behaSubject.onNext("ccc")
        
        // ReplaySubject
        print("-------ReplaySubject")
        let replaySubject = ReplaySubject<String>.createUnbounded()
        replaySubject.onNext("aaa")
        replaySubject.onNext("bbb")
        replaySubject.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        replaySubject.onNext("ccc")
        replaySubject.onNext("ddd")
        
        // Variable: Variable is deprecated. Please use `BehaviorRelay` as a replacement.
        
        // BehaviorRelay 它的本质其实也是对 BehaviorSubject 的封装
        print("-------BehaviorRelay")
        let behaviorRelay = BehaviorRelay(value: "aa")
        behaviorRelay.accept("bb")
        behaviorRelay.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        behaviorRelay.accept("cc")
        behaviorRelay.accept("dd")
    }
}
