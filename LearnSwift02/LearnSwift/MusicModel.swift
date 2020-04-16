//
//  MusicModel.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import Foundation

struct MusicModel {
    var name: String
    var singer: String
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension MusicModel : CustomStringConvertible {
    var description: String {
        return "name: \(name), singer: \(singer)"
    }
}
