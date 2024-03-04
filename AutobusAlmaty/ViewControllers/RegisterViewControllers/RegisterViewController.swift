//
//  RegisterViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/02/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, surnameTextField, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
       
        return stackView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Name"
        textField.backgroundColor = .primaryGray
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        return textField
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Surname"
        textField.backgroundColor = .primaryGray
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        return textField
    }()
    
    private let registerButton = PrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhite
        configureView()
        setupConstrain()
        
        registerButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func configureView() {
        registerButton.setTitle("Register", for: .normal)
        view.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    private func setupConstrain() {
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(32)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(50)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        surnameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    @objc func didTapButton() {
        let vc = StartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


