//
//  demo30.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/16.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Demo30 {
    var bag = DisposeBag()
    func test(_ view: UIView) {
        let tv = UITableView(frame: view.bounds)
        view.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let justO = Observable.just([
            "1.int",
            "2.float",
            "3.string"
        ])
        
        justO.bind(to: tv.rx.items) { (tableView, row, element) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = element
            return cell!
        }.disposed(by: bag)
        
        // 1. 选择方式
//        tv.rx.itemSelected.subscribe { (event: Event<IndexPath>) in
//            print(event)
//        }.disposed(by: bag)
//
//        tv.rx.modelSelected(String.self).subscribe { (event: Event<String>) in
//            print(event)
//        }.disposed(by: bag)
        
        // 2. 合并选择
        Observable.zip(tv.rx.itemSelected, tv.rx.modelSelected(String.self)).subscribe(onNext: { (indexPath: IndexPath, element: String) in
            print(indexPath)
            print(element)
        }).disposed(by: bag)
    
    }
}
