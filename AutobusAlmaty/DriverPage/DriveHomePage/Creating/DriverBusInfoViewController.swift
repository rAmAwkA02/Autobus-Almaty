//
//  DriverBusInfoViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 27/03/2024.
//

import UIKit

class DriverBusInfoViewController: UIViewController {

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
        
        let busImageView = UIImageView()
        busImageView.image = UIImage(named: "busImage")
        busImageView.clipsToBounds = true
        busImageView.layer.cornerRadius = 8
        view.addSubview(busImageView)
        busImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        let busIdNumberLabel = UILabel()
        busIdNumberLabel.text = "Id number"
        busIdNumberLabel.font = .medium18
        
        let busIdNumberTextField = UITextField()
        busIdNumberTextField.placeholder = "1498r892 kz01"
        busIdNumberTextField.clipsToBounds = true
        busIdNumberTextField.layer.cornerRadius = 8
        busIdNumberTextField.layer.borderWidth = 1
        busIdNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let busTypeLabel = UILabel()
        busTypeLabel.text = "Type"
        busTypeLabel.font = .medium18
        
        let busTypeTextField = UITextField()
        busTypeTextField.placeholder = "First floor bus"
        busTypeTextField.clipsToBounds = true
        busTypeTextField.layer.cornerRadius = 8
        busTypeTextField.layer.borderWidth = 1
        busTypeTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let vContainer = UIStackView(arrangedSubviews: [busIdNumberLabel, busIdNumberTextField, busTypeLabel, busTypeTextField])
        vContainer.axis = .vertical
        vContainer.alignment = .fill
        vContainer.distribution = .equalSpacing
        vContainer.spacing = 10
        
        view.addSubview(vContainer)
        vContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(busImageView.snp.bottom).offset(16)
        }
        
        let editInfoButton = PrimaryButton()
        editInfoButton.setTitle("Edit information", for: .normal)
        editInfoButton.addTarget(self, action: #selector(editInfoButtonTapDid), for: .touchUpInside)
        view.addSubview(editInfoButton)
        editInfoButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
        
        
    }
    
    
    @objc func backButtonTapped() {
        // Handle the back action, e.g., pop the view controller
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editInfoButtonTapDid() {
        // TODO: 
    }



}
