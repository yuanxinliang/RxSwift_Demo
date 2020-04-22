//
//  AppDelegate.swift
//  LearnSwift
//
//  Created by jdapple on 2020/4/14.
//  Copyright © 2020 jdapple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let item1 = UIApplicationShortcutItem(type: "1", localizedTitle: "分享APP", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .share), userInfo: nil)
        let item2 = UIApplicationShortcutItem(type: "2", localizedTitle: "二维码", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .contact), userInfo: nil)
        let item3 = UIApplicationShortcutItem(type: "3", localizedTitle: "转账", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .cloud), userInfo: nil)
        let item4 = UIApplicationShortcutItem(type: "4", localizedTitle: "扫一扫", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .add), userInfo: nil)
        let item5 = UIApplicationShortcutItem(type: "5", localizedTitle: "积分", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .add), userInfo: nil)
        let item6 = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.alarm)
        

           
//        application.shortcutItems = [item1, item2, item3, item4, item5]
        application.shortcutItems = [item1]
        
        return true
    }

}

