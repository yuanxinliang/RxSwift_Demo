//
//  demo3.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

class Demo4 {
    var bag = DisposeBag()
    func test() {
        let fromO = Observable.from([1, 3, 5, 7])
        
        fromO.subscribe { (event: Event<Int>) in
            print(event)
        }.disposed(by: bag)
        
        fromO.subscribe(onNext: { (num) in
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: bag)
        
        fromO.do(onNext: { (num) in
            
        }, afterNext: { (num) in
            
        }, onError: { (error) in
            
        }, afterError: { (error) in
            
        }, onCompleted: {
            
        }, afterCompleted: {
            
        }, onSubscribe: {
            
        }, onSubscribed: {
            
        }, onDispose: {
            
        })
        .subscribe { (event:Event<Int>) in
                print(event)
        }.disposed(by: bag)
    }
}
