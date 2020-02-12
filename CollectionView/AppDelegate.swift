//
//  AppDelegate.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let cv = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav = UINavigationController(rootViewController: cv)
        
        cv.view.backgroundColor = #colorLiteral(red: 1, green: 0.855716867, blue: 0.8502665384, alpha: 1)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

}

