//
//  demo43.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/18.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Alamofire

class Demo43 {
    var bag = DisposeBag()
    
    func test() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        var urlReq = URLRequest(url: URL(string: "")!)
        urlReq.timeoutInterval = 1
        urlReq.allHTTPHeaderFields = nil
//        urlReq.httpBody
        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
        let session = Alamofire.SessionManager(configuration: config)
        session.request(URLRequest(url: URL(string: "")!, cachePolicy: .returnCacheDataDontLoad, timeoutInterval: 1)).responseJSON { (data) in
            print(data)
        }
        
    }
    
    func test2() {
        let url = URL(string: "https://www.douban.com/j/app/radio/channels")
        let request = URLRequest(url: url!)
        URLSession.shared.rx.response(request: request)
            .subscribe(onNext: { (response, data) in
                print(response.statusCode, data.count)
            })
            .disposed(by: bag)
    }
    
    func test1() {
        let url = URL(string: "https://www.douban.com/j/app/radio/channels")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if let a = data, let b = response {
                let json = try! JSONSerialization.jsonObject(with: a, options: .allowFragments)
                print(json)
                print((b as? HTTPURLResponse)?.statusCode ?? 0)
            }
        })
        task.resume()
    }
}
