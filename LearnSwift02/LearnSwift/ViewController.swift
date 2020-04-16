//
//  ViewController.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    fileprivate var bag = DisposeBag()
    fileprivate var viewModel = MusicListViewModel()
    fileprivate lazy var tableView = UITableView(frame: view.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        // 绑定数据显示
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { (index, music, cell) in
            print("\(index) - \(music)")
            cell.textLabel?.text = "\(index + 1).\(music.name) - \(music.singer)"
        }.disposed(by: bag)
        
        // 点击事件
        tableView.rx.itemSelected.subscribe { [unowned self] (event: Event<IndexPath>) in
            print(event)
            self.tableView.deselectRow(at: event.element!, animated: true)
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(MusicModel.self).subscribe { (event: Event<MusicModel>) in
            print(event)
        }.disposed(by: bag)
    }

}

