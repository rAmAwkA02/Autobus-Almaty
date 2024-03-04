//
//  AppDelegate.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/02/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .primaryWhite
        window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
        Thread.sleep(forTimeInterval: 0.5)
        return true
    }

}

