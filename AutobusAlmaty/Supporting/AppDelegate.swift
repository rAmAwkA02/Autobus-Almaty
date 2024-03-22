//
//  AppDelegate.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/02/2024.
//

import UIKit

let appColor: UIColor = .primaryBlue

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .primaryWhite
        window?.rootViewController = UINavigationController(rootViewController: SignInPassengerViewController())
        Thread.sleep(forTimeInterval: 0.5)
        
//        mainViewController.selectedIndex = 0
        return true
    }

}

