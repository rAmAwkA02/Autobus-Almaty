//
//  DriverProfileViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 27/03/2024.
//

import UIKit

class DriverProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    private func configUI() {
        
        view.backgroundColor = .primaryWhite
        
        let profileImageView  = UIImageView()
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 8
        
        
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Nurbek Chakmak"
        fullNameLabel.font = .bold20
        fullNameLabel.textColor = .primaryBlue
        
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.text = "87777777777"
        phoneNumberLabel.font = .regular16
        
        let companyNameLabel = UILabel()
        companyNameLabel.text = "“Lucia” Ltd"
        companyNameLabel.font = .regular16
        
        let emailLabel = UILabel()
        emailLabel.text = "sadsadsa@gmail.com"
        emailLabel.font = .regular16
        
        let vContainer = UIStackView(arrangedSubviews: [fullNameLabel, phoneNumberLabel, companyNameLabel, emailLabel])
        vContainer.axis = .vertical
        vContainer.alignment = .fill
        vContainer.distribution = .fill
        vContainer.spacing = 2
        
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        let hContainer = UIStackView(arrangedSubviews: [profileImageView, vContainer])
        hContainer.axis = .horizontal
        hContainer.distribution = .fill
        hContainer.spacing = 8
        
        view.addSubview(hContainer)
        hContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
        }
        
        
        
        let editProfileButton = UIButton()
        editProfileButton.setTitle("Edit profile", for: .normal)
        editProfileButton.contentHorizontalAlignment = .left
        editProfileButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        editProfileButton.clipsToBounds = true
        editProfileButton.layer.cornerRadius = 8
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor(hex: "2F4C78").cgColor
        editProfileButton.titleLabel?.font = .medium20
        editProfileButton.setTitleColor(.primaryBlue, for: .normal)
        editProfileButton.addTarget(self, action: #selector(editProfilTapDid), for: .touchUpInside)
        
        view.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(hContainer.snp.bottom).offset(32)
            make.height.equalTo(36)
        }
        
        let busInfoButton = UIButton()
        busInfoButton.setTitle("Bus information", for: .normal)
        busInfoButton.contentHorizontalAlignment = .left
        busInfoButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        busInfoButton.clipsToBounds = true
        busInfoButton.layer.cornerRadius = 8
        busInfoButton.layer.borderWidth = 1
        busInfoButton.layer.borderColor = UIColor(hex: "2F4C78").cgColor
        busInfoButton.titleLabel?.font = .medium20
        busInfoButton.setTitleColor(.primaryBlue, for: .normal)
        busInfoButton.addTarget(self, action: #selector(busInfoButtonTapDid), for: .touchUpInside)
        
        view.addSubview(busInfoButton)
        busInfoButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(editProfileButton.snp.bottom).offset(8)
            make.height.equalTo(36)
        }
        
        let logOutButton = UIButton()
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.clipsToBounds = true
        logOutButton.layer.cornerRadius = 8
        logOutButton.titleLabel?.font = .medium20
        logOutButton.setTitleColor(.systemRed, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapDid), for: .touchUpInside)
        
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(busInfoButton.snp.bottom).offset(16)
        }
        
        
    }
    
    @objc func editProfilTapDid() {
        let vc = DriverProfileEditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func busInfoButtonTapDid() {
        let vc = DriverBusInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logOutButtonTapDid() {
        // TODO: 
    }
    
}

