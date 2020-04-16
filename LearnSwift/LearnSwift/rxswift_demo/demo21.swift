//
//  demo21.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/15.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class Demo21 {
    var bag = DisposeBag()
    func test(_ view: UIView) {
        let label = UILabel(frame: CGRect(x: 40, y: 100, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        view.addSubview(label)
        
        let intervalO = Observable<Int>.interval(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)

//        intervalO
//        .map({String(format: "计时器：%02d:%02d.%01d", ($0 / 600) % 60, ($0 / 10) % 60 , $0 % 10)})
//        .bind(to: label.rx.text)
//        .disposed(by: bag)
        
        intervalO
            .map({self.format(ms:$0)})
            .bind(to: label.rx.attributedText)
            .disposed(by: bag)
        
    }
    
    func format(ms: Int) -> NSMutableAttributedString {
        let msStr = String(format: "计时器：%02d:%02d.%01d", (ms / 600) % 60, (ms / 10) % 60 , ms % 10)
        let attri = NSMutableAttributedString(string: msStr)
        attri.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: NSRange(location: 0, length: 4))
        return attri
    }
}
