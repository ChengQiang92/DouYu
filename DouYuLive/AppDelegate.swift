//
//  AppDelegate.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/18.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange
//        UINavigationBar.appearance().tintColor = UIColor.orange
        
        return true
    }



}

