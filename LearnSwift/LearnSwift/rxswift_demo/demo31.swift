//
//  demo31.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/16.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources

class Demo31 {
    var bag = DisposeBag()
    
    // 多分区
    func test(_ view: UIView) {
        
        let tv = UITableView(frame: view.bounds)
        view.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 初始化数据
        let items = Observable.just([
            SectionModel(model: "基本控件", items: [
                "UILable的用法",
                "UIButton的用法",
                "UITextField的用法",
            ]),
            SectionModel(model: "滚动控件", items: [
                "UITableView的用法",
                "UICollectionView的用法",
            ]),
        ])
        
        // 创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(configureCell: {
            (dataSource, tableView, index, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = "\(index.section + 1).\(index.row + 1) - \(element)"
            return cell!
        })
        
        // 设置分区头标题
        dataSource.titleForHeaderInSection = { ds, indexPath in
            return ds.sectionModels[indexPath].model
        }
        
        // 绑定数据
        items.bind(to: tv.rx.items(dataSource: dataSource)).disposed(by: bag)
        
    }
    
    // 单分区
    func test1(_ view: UIView) {
        
        let tv = UITableView(frame: view.bounds)
        view.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 初始化数据
        let items = Observable.just([
            SectionModel(model: "", items: [
                "UILable的用法",
                "UIButton的用法",
                "UITextField的用法",
            ])
        ])
        
        // 创建数据源
        let dataSources = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(configureCell: {
            (dataSource, tableView, index, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = element
            return cell!
        })
        
        // 绑定数据
        items.bind(to: tv.rx.items(dataSource: dataSources)).disposed(by: bag)
        
    }
}
