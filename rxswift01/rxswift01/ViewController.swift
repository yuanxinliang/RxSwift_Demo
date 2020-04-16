//
//  ViewController.swift
//  rxswift01
//
//  Created by jdapple on 2020/4/13.
//  Copyright © 2020 jdapple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var titles = [
        "RxSwift 简单体验",
        "RxSwift 常见操作",
        "RxSwift 的Subjects",
        "RxSwift 变换操作",
        "RxSwift tableview",
    ]
    
    lazy var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        let tv = UITableView(frame: self.view.bounds);
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self,
                    forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tv.tableFooterView = UIView()
        self.view.addSubview(tv)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            navigationController?.pushViewController(ViewController1(), animated: true)
        } else if indexPath.row == 1 {
            rxSwift_operate()
        } else if indexPath.row == 2 {
            rxSwift_subjects()
        } else if indexPath.row == 3 {
            rxSwift_map()
        } else if indexPath.row == 4 {
                   
        }
    }
}

