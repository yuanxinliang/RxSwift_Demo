//
//  demo22.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class Demo22 {
    
    var bag = DisposeBag()
    
    func test(_ view: UIView) {
//        let tf1 = UITextField(frame: CGRect(x: 40, y: 120, width: 200, height: 50))
//        tf1.borderStyle = .roundedRect
//        view.addSubview(tf1)
//
//        tf1.rx.text.orEmpty.asObservable()
//            .subscribe(onNext: { print("asObservable: \($0)") })
//            .disposed(by: bag)
//
//        tf1.rx.text.orEmpty.changed
//        .subscribe(onNext: { print("change: \($0)") })
//        .disposed(by: bag)
//        demo1(view)
        demo2(view)
    }
    
    func demo1(_ view: UIView) {
        
        let tf1 = UITextField(frame: CGRect(x: 40, y: 120, width: 200, height: 50))
        tf1.borderStyle = .roundedRect
        view.addSubview(tf1)
        
        let tf2 = UITextField(frame: CGRect(x: 40, y: 200, width: 200, height: 50))
        tf2.borderStyle = .roundedRect
        view.addSubview(tf2)
        
        let label = UILabel(frame: CGRect(x: 40, y: 280, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        
        let btn = UIButton(frame: CGRect(x: 40, y: 360, width: 200, height: 50))
        btn.backgroundColor = UIColor.orange
        btn.setTitle("提交", for: .normal)
        btn.setTitleColor(.cyan, for: .normal)
        btn.setTitleColor(.gray, for: .disabled)
        btn.isEnabled = false
        view.addSubview(btn)
        
//        tf1.rx.text.orEmpty.asObservable()
//            .bind(to: label.rx.text)
//            .disposed(by: bag)
//
//        tf1.rx.text.orEmpty.asObservable()
//            .map({ ($0).count >= 4 })
//            .bind(to: btn.rx.isEnabled)
//            .disposed(by: bag)
        
        let input = tf1.rx.text.orEmpty.asDriver().throttle(RxTimeInterval.milliseconds(300))
        
        input
        .drive(tf2.rx.text)
        .disposed(by: bag)
        
        input
        .map({ "当前字数：\($0.count)" })
        .drive(label.rx.text)
        .disposed(by: bag)
        
        input
        .map({ ($0).count >= 4 })
        .drive(btn.rx.isEnabled)
        .disposed(by: bag)
    }
    
    func demo2(_ view: UIView) {
        let tf1 = UITextField(frame: CGRect(x: 40, y: 120, width: 200, height: 50))
        tf1.borderStyle = .roundedRect
        view.addSubview(tf1)
        
        let tf2 = UITextField(frame: CGRect(x: 40, y: 200, width: 200, height: 50))
        tf2.borderStyle = .roundedRect
        view.addSubview(tf2)
        
        let label = UILabel(frame: CGRect(x: 40, y: 280, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 40, y: 360, width: 200, height: 150))
        textView.backgroundColor = UIColor.orange
        view.addSubview(textView)
        
        Observable.combineLatest(tf1.rx.text.orEmpty, tf2.rx.text.orEmpty) { (value1, value2) -> String in
            return "区号：\(value1), 号码：\(value2)"
            }.bind(to: label.rx.text).disposed(by: bag)
        
        tf1.rx.controlEvent([.editingDidBegin]).asObservable().subscribe({(event) in
            print(event)
        }).disposed(by: bag)
        
        tf1.rx.controlEvent([.editingDidEndOnExit]).asObservable().subscribe({(event) in
            tf2.becomeFirstResponder()
        }).disposed(by: bag)
        
        tf2.rx.controlEvent([.editingDidEndOnExit]).asObservable().subscribe({(event) in
            tf2.resignFirstResponder()
        }).disposed(by: bag)
        
        textView.rx.didBeginEditing.subscribe({ _ in
            print("didBeginEditing")
        }).disposed(by: bag)
        
        textView.rx.didEndEditing.subscribe({ _ in
            print("didEndEditing")
        }).disposed(by: bag)
        
        textView.rx.didChange.subscribe({ _ in
            print("didChange")
        }).disposed(by: bag)
        
        textView.rx.didChangeSelection
            .subscribe({ _ in
                print("didChangeSelection")
            })
            .disposed(by: bag)
        
    }
    
    
}

