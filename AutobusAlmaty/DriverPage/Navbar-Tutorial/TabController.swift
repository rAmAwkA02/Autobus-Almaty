//
//  TabController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 17/03/2024.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.tintColor = .green
        self.tabBar.unselectedItemTintColor = .purple
    }
    
    // MARK: - Tab Setup
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let history = self.createNav(with: "History", and: UIImage(systemName: "clock"), vc: HistoryController())
        let workout = self.createNav(with: "Workout", and: UIImage(systemName: "person"), vc: WorkoutController())
        let exercise = self.createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: ExerciseController())
        
        
        self.setViewControllers([], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }


}
