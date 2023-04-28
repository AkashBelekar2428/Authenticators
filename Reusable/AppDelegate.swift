//
//  AppDelegate.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController.init()
        self.window?.makeKeyAndVisible()
        return true
    }
}

