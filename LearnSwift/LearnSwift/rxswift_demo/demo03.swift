//
//  demo2.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

// Swift - RxSwift的使用详解3（Observable介绍、创建可观察序列） https://www.hangge.com/blog/cache/detail_1922.html
class Demo03 {
    
    func createObservable() {
        // just
        let justO = Observable.just("a")
        // of
        let ofO = Observable.of("a", "b", "c")
        // from
        let fromO = Observable.from([1, 2, 3])
        // empty
        let emptyO = Observable<Any>.empty()
        // never
        let neverO = Observable<Any>.never()
        // error
        enum MyError: Error {
            case A
            case B
        }
        let errorO = Observable<Int>.error(MyError.A)
        // range
        let rangeO = Observable.range(start: 1, count: 5)
        // repeatElement
        let repeatO = Observable.repeatElement(2)
        // generate
        let generateO = Observable.generate(
            initialState: 0,
            condition: { (element) -> Bool in
            return element >= 10},
            iterate:  { (element) -> Int in
            return element + 2}
        )
        // create
        let createO = Observable<Int>.create { (observe: AnyObserver<Int>) -> Disposable in
            observe.onNext(1)
            observe.onNext(2)
            observe.onCompleted()
            return Disposables.create()
        }
        // deferred 延迟
        var isOdd = true
        let factory: Observable<Int> = Observable<Int>.deferred { () -> Observable<Int> in
            isOdd = !isOdd
            if isOdd {
                return Observable.from([1, 3, 5])
            } else {
                return Observable.from([2, 4, 6])
            }
        }
        factory.subscribe { (event: Event<Int>) in
            print(event)
        }
        factory.subscribe { (event: Event<Int>) in
            print(event)
        }
        // interval
        let intervalO = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        // timer
        let timer1O = Observable<Int>.timer(5, scheduler: MainScheduler.instance)
        let timer2O = Observable<Int>.timer(5, period: 1, scheduler: MainScheduler.instance)
    }
}
