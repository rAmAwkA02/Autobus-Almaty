//
//  OnboardingViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/02/2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    private var onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "busIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .bold28
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .primaryBlue
        label.text = "Track your \ntrips anytime"
        return label
    }()
    
    private var loginButton = PrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupConstrain()
        
        self.loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func configureView() {
        loginButton.setTitle("Start now", for: .normal)
    }
    
    private func setupConstrain() {
        view.addSubview(onboardingImageView)
        onboardingImageView.snp.makeConstraints { make in
            make.height.equalTo(240)
            make.leading.trailing.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
    
    @objc func didTapButton() {
        let vc = SignInPassengerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

