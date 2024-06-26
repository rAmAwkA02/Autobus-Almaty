//
//  MainViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 17/03/2024.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }

    private func setupViews() {
        let homeVC = DriverHomeViewController()
        let addRouteVC = DriverCreatingRouteViewController()
        let profileVC = DriverProfileViewController()

        homeVC.setTabBarImage(imageName: "house", title: "Home")
        addRouteVC.setTabBarImage(imageName: "plus", title: "Add Route")
        profileVC.setTabBarImage(imageName: "person.crop.circle", title: "Profile")

        let homeNC = UINavigationController(rootViewController: homeVC)
//        let addRouteNC = UINavigationController(rootViewController: addRouteVC)
//        let profileNC = UINavigationController(rootViewController: profileVC)

        homeNC.navigationBar.isHidden = true
//        addRouteNC.navigationBar.isHidden = true
//        profileNC.navigationBar.isHidden = true
        hideNavigationBarLine(homeNC.navigationBar)
        
        let tabBarList = [homeVC, addRouteVC, profileVC]

        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
