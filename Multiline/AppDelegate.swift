//
//  AppDelegate.swift
//  Multiline
//
//  Created by hongwuzhao on 4/17/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MainPageViewController()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
        themesInit()
        return true
    }
}


extension AppDelegate {
    func themesInit() {
        UICollectionView.appearance().backgroundColor = .white
    }
}
