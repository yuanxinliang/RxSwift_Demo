//
//  RxSwift简单体验.swift
//  rxswift01
//
//  Created by jdapple on 2020/4/13.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/** rxswift简单体验
* 1. button的点击事件
* 2.tf的监听
* 3.label的绑定
* 4.kvo的监听
* 5.scrollview的滚动
*/

class ViewController1: UIViewController {
    
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        // btn
        let btn = UIButton.init(frame: CGRect(x: 30, y: 40, width: 200, height: 50))
        btn.backgroundColor = UIColor.orange
        btn.setTitle("按钮", for: .normal)
        view.addSubview(btn)
        btn.rx.tap.subscribe { (event: Event<Void>) in
            print(event)
        }.disposed(by: disposeBag)
        
        // tf
        let tf = UITextField(frame: CGRect(x: 30, y: 120, width: 200, height: 50))
        tf.borderStyle = .roundedRect
        view.addSubview(tf)
        tf.rx.text.subscribe { (event: Event<String?>) in
            print("-" + event.element!! + "-")
        }.disposed(by: disposeBag)
        
        // label
        let label = UILabel(frame: CGRect(x: 30, y: 200, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        tf.rx.text.bind(to: label.rx.text).disposed(by: disposeBag)
        
        // kvo
        label.rx.observe(String.self, "text").subscribe({ (event: Event<String?>) in
            print("kvo：\(event)")
        }).disposed(by: disposeBag)
        
        // scrollview
        let scrollview = UIScrollView(frame: CGRect(x: 30, y: 280, width: 200, height: 200))
        scrollview.contentSize = CGSize(width: 200, height: 1000)
        scrollview.backgroundColor = UIColor.orange
        view.addSubview(scrollview)
        scrollview.rx.contentOffset.subscribe { (event: Event<CGPoint>) in
            print("offset：\(event.element!)")
        }.disposed(by: disposeBag)
    }
    
    deinit {
        print("deinit")
    }
}

