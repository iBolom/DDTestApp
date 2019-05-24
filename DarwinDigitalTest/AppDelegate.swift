//
//  AppDelegate.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let tabBarController = window?.rootViewController as? UITabBarController,
            let listViewController = tabBarController.viewControllers?.first as? ListViewController {
            // Fetch list of users and pass to ListViewController
            APIManager.shared.getUsers {(users, error) in
                if let users = users {
                    listViewController.users = users
                }
            }
        }
        
        return true
    }
}

