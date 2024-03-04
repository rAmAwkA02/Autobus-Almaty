//
//  MainPageViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 04/03/2024.
//

import Foundation
import UIKit
import SnapKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Welcome to main page"
        label.textColor = .black
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}


