//
//  StartViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/02/2024.
//

import UIKit

class StartViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textColor = .primaryBlue
        label.font = .bold20
        return label
    }()
    
    private let startButton = PrimaryButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhite
        configureView()
        setupConstrain()
    }
    
    private func configureView() {
        startButton.setTitle("Start", for: .normal)
     
    }
    
    private func setupConstrain() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
}

