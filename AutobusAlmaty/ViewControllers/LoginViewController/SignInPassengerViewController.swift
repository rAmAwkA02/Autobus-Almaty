//
//  SignInPassengerViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 22/02/2024.
//

import UIKit
import SnapKit

enum UserType: String {
    case passenger
    case driver
}

class SignInPassengerViewController: UIViewController {
    
    private var signInType: UserType = .passenger
    
    private let viewModel: LoginViewModel = LoginViewModel()
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.backgroundColor = .primaryGray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInLabel, phoneNumberTextField, passwordTextField, logInButton, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in \nvia passenger"
        label.textColor = .primaryBlue
        label.font = .bold32
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
        
    private let phoneNumberTextField: PrimaryTextField = {
        let textField = PrimaryTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .primaryWhite
        textField.layer.cornerRadius = 8
        textField.placeholder = "Phone number"
        textField.font = .regular16
        textField.autocapitalizationType = .none
        return textField
    }()
    
    // TODO: eye button
    
//        let showPasswordButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: "eye_open"), for: .normal)
//        button.setImage(UIImage(named: "eye_hide"), for: .selected)
//        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
//        return button
//    }()

    
    private let passwordTextField: PrimaryTextField = {
        let textField = PrimaryTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .primaryWhite
        textField.layer.cornerRadius = 8
        textField.font = .regular16
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        
        // TODO: eye button
        
//        let showPasswordButton: UIButton = {
//        let showPasswordButton = UIButton(type: .custom)
//        showPasswordButton.setImage(UIImage(named: "eye_open"), for: .normal)
//        showPasswordButton.setImage(UIImage(named: "eye_hide"), for: .selected)
//        showPasswordButton.
//        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
//
//        textField.rightView = showPasswordButton
//        textField.rightViewMode = .always
            
        return textField
    }()

    private let logInButton = PrimaryButton()
    
    private let registerButton: PrimaryButton = {
        let button = PrimaryButton()
        button.addTarget(self, action: #selector(signUpTap), for: .touchUpInside)
        return button
    }()
    
    private let changeSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("are you a driver?", for: .normal)
        button.setTitleColor(.primaryBlue, for: .normal)
        button.backgroundColor = .systemBackground
        button.titleLabel?.font = .regular16
        button.addTarget(self, action: #selector(changeSignInTap), for: .touchUpInside)
        return button
    }()
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhite
        configureView()
        setupConstrain()
        logInButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    private func configureView() {
        logInButton.setTitle("Log in", for: .normal)
        registerButton.setTitle("Register", for: .normal)
        view.addSubview(contentView)
        contentView.addSubview(stackView)
        view.addSubview(changeSignInButton)
    }
    
    private func setupConstrain() {
        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
        
        changeSignInButton.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
    
    @objc func signUpTap() {
        let vc = SignUpPassengerViewController(userType: self.signInType)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeSignInTap() {
        if signInType == .driver {
            signInLabel.text = "Sign in \nvia passenger"
            changeSignInButton.setTitle("are you a driver?", for: .normal)
            signInType = .passenger
        } else {
            signInLabel.text = "Sign in \nvia driver"
            changeSignInButton.setTitle("are you a passenger?", for: .normal)
            signInType = .driver
        }
    }
    
    @objc
    private func loginAction() {
        viewModel.login(user: User(username: phoneNumberTextField.text!, password: passwordTextField.text!)) { res in
            DispatchQueue.main.async {  [weak self] in
                if res == "Logged succesfully!" {
                    let vc = MainPageViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let alert = UIAlertController(title: "!!!", message: "Such user doesn't exist", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    // TODO: eye button
//    @objc func showPasswordButtonTapped() {
//        passwordTextField.isSecureTextEntry.toggle()
//    }
}




