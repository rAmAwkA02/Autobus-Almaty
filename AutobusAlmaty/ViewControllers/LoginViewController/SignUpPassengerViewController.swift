//
//  SignUpPassengerViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/02/2024.
//

import UIKit
import SnapKit

class SignUpPassengerViewController: UIViewController {
    
    private let userType: UserType
    
    private let viewModel: SignUpViewModel = SignUpViewModel()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.backgroundColor = .primaryGray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneNumberTextField, passwordTextField, confirmPasswordTextField, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    private let phoneNumberTextField: PrimaryTextField = {
        let textField = PrimaryTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .primaryWhite
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextField: PrimaryTextField = {
        let textField = PrimaryTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .primaryWhite
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        textField.autocapitalizationType = .none
        //        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let confirmPasswordTextField: PrimaryTextField = {
        let textField = PrimaryTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .primaryWhite
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        textField.autocapitalizationType = .none
        //        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let registerButton = PrimaryButton()
    
    init(userType: UserType) {
        self.userType = userType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhite
        configureView()
        setupConstrain()
        
        registerButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func configureView() {
        registerButton.setTitle("Register", for: .normal)
        
        switch userType {
        case .passenger:
            phoneNumberTextField.placeholder = "Enter passenger phone number"
            passwordTextField.placeholder = "Enter passenger password"
            confirmPasswordTextField.placeholder = "Confirm passenger password"
        case .driver:
            phoneNumberTextField.placeholder = "Enter driver phone number"
            passwordTextField.placeholder = "Enter driver password"
            confirmPasswordTextField.placeholder = "Confirm driver password"
        }
        
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
        phoneNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        confirmPasswordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    @objc func didTapButton() {
        viewModel.register(user: User(username:
                                        phoneNumberTextField.text!,
                                      password: passwordTextField.text!), callback: { [weak self] res in
            
            DispatchQueue.main.async { [weak self] in
                let alert = UIAlertController(title: "!!!", message: res, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self?.present(alert, animated: true, completion: nil)
            }
        })
        
        
    }
    
}
