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

    let demo5 = Demo5()
    let demo6 = Demo6()
    let demo21 = Demo21()
    let demo22 = Demo22()
    let demo27 = Demo27()
    let demo30 = Demo30()
    var demo: Any?
    override func viewDidLoad() {
        super.viewDidLoad()
//        collection(view)
        // Do any additional setup after loading the view.
//        demo5.test()
//        demo6.test()
//        Demo7().test()
//        demo21.test(view)
//        demo22.test(view)
//        demo27.test(view)
//        demo30.test(view)
        demo = Demo43()
        (demo as! Demo43).test()
        
        
    }
    
    func collection(_ view: UIView) {
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = (view.bounds.size.width - 30) / 2
        let height = width * 1.5
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        navigationController?.pushViewController(WeakControllerView(), animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        cell.backgroundColor = UIColor.orange
        cell.text = "\(indexPath.row + 1)"
        return cell
    }
    
    
    
}

class MyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews(frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    func setupSubViews(_ frame: CGRect) {
        label.frame = frame
        label.textAlignment = .center
        contentView.addSubview(label)
    }
    
    fileprivate lazy var label = UILabel()
    
    var text: String {
        get {
            return ""
        }
        set {
            label.text = newValue
        }
    }
    
}

