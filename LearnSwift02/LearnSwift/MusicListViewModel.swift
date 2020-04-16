//
//  MusicListViewModel.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation
import RxSwift

struct MusicListViewModel {
    let data = Observable.just([
        MusicModel(name: "开心的马骝", singer: "刘德华"),
        MusicModel(name: "突然的自我", singer: "伍佰"),
        MusicModel(name: "夕阳无限好", singer: "张学友"),
        MusicModel(name: "爷爷泡的茶", singer: "周杰伦"),
    ])
}
