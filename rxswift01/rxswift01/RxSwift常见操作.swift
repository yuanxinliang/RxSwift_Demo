//
//  RxSwift常见操作.swift
//  rxswift01
//
//  Created by jdapple on 2020/4/13.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

/** rxswift常见操作
* 1. obserable-never
* 2. obserable-empty
* 3. obserable-just
* 4. obserable-of
* 5. obserable-from数组
* 6. obserable-create
* 7. obserable-range
* 8. obserable-repeatElement
*/

extension ViewController {
    
    func rxSwift_operate() {
        
        // 创建一个never的obserable
        let neverO = Observable<String>.never()
        neverO.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个empty的obserable
        print("------------empty-------------")
        let emptyO = Observable<String>.empty()
        emptyO.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个just的obserable
        print("------------just-------------")
        let justO = Observable.just("code")
        justO.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个of的obserable
        print("------------of-------------")
        let ofO = Observable.of("a", "b", "c")
        ofO.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个from的obserable
        print("------------from-------------")
        let fromO = Observable.from(["1 element", "sec element", "thi element"])
        fromO.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个create的obserable：自定义
        print("------------create-------------")
        let create = Observable.create { (observer: AnyObserver<Any>) -> Disposable in
            observer.onNext("name:tony")
            observer.onNext("age:18")
            observer.onNext("height:188")
            observer.onCompleted()
            return Disposables.create()
        }
        create.subscribe { (event: Event<Any>) in
            print(event)
        }.disposed(by: bag)
    
        // 创建一个range的obserable
        print("------------range-------------")
        let rangeO = Observable.range(start: 0, count: 10)
        rangeO.subscribe { (event: Event<Int>) in
            print(event)
        }.disposed(by: bag)
        
        // 创建一个repeatElement的obserable
        print("------------repeatElement-------------")
        let repeatO = Observable.repeatElement("hello world")
        repeatO.take(5).subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        
    }
    
}
