//
//  DriverProfileEditViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 27/03/2024.
//


import UIKit

class DriverProfileEditViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupBackButton()
    }
    
    private func setupBackButton() {
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        
        let backTitleLabel = UILabel()
        backTitleLabel.text = "Back"
        backTitleLabel.font = .medium18
        backButton.addSubview(backTitleLabel)
        
        backTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.left.equalTo(backButton.imageView!.snp.right).offset(8)
        }

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    
    private func configUI() {
        view.backgroundColor = .primaryWhite
    
                
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 8
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // Center the imageView horizontally
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                    make.width.height.equalTo(150) // Set fixed width and height
        }
        
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Full name"
        fullNameLabel.font = .medium18
        
        let fullNameTextField = UITextField()
        fullNameTextField.placeholder = "Nurbek Chakmak"
        fullNameTextField.clipsToBounds = true
        fullNameTextField.layer.cornerRadius = 8
        fullNameTextField.layer.borderWidth = 1
        
        fullNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.text = "Phone number"
        phoneNumberLabel.font = .medium18
        
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "87777777777"
        phoneNumberTextField.clipsToBounds = true
        phoneNumberTextField.layer.cornerRadius = 8
        phoneNumberTextField.layer.borderWidth = 1
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let companyNameLabel = UILabel()
        companyNameLabel.text = "Company name"
        companyNameLabel.font = .medium18
        
        let companyNameTextField = UITextField()
        companyNameTextField.placeholder = "Lucia Ltd"
        companyNameTextField.clipsToBounds = true
        companyNameTextField.layer.cornerRadius = 8
        companyNameTextField.layer.borderWidth = 1
        
        companyNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = .medium18
        
        let emailTextField = UITextField()
        emailTextField.placeholder = "sdsadasdasd@gmail.com"
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderWidth = 1
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let vContainer = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField, phoneNumberLabel, phoneNumberTextField, companyNameLabel, companyNameTextField, emailLabel, emailTextField]
        )
        vContainer.axis = .vertical
        vContainer.alignment = .fill
        vContainer.distribution = .equalSpacing
        vContainer.spacing = 10
        
        view.addSubview(vContainer)
        vContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
        }
        
        let editProfileButton = PrimaryButton()
        editProfileButton.setTitle("Edit profile", for: .normal)
        editProfileButton.addTarget(self, action: #selector(editProfileButtonTapDid), for: .touchUpInside)
        view.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
        

    }
    
    @objc func backButtonTapped() {
        // Handle the back action, e.g., pop the view controller
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editProfileButtonTapDid() {
        // TODO: 
    }
    
    
}

