//
//  OTPClassView.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 28/02/2024.
//

import UIKit
import SnapKit

protocol OTPAuthenticationViewDelegate: AnyObject {
    func didVerifyOTP(_ otp: String)
    func didTapResendButton()
}

class OTPAuthenticationView: UIView, UITextFieldDelegate {
    weak var delegate: OTPAuthenticationViewDelegate?
    
    // UI Elements
    private let otpStackView = UIStackView()
    private var otpTextFields = [UITextField]()
    private let resendButton = UIButton()
    
    // timer properties
    private var timer: Timer?
    private var remainingTime = 30 // duration in seconds
    private var isTimerRunning = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        // Configure OTP Stack View
        otpStackView.axis = .horizontal
        otpStackView.alignment = .fill
        otpStackView.distribution = .fillEqually
        otpStackView.spacing = 8
        
        // Create OTP Text Fields
        for _ in 0..<4 { // 4 fields for OTP
            let textField = UITextField()
            textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
            textField.textAlignment = .center
            textField.font = UIFont.systemFont(ofSize: 20)
            textField.layer.cornerRadius = 8
            textField.layer.masksToBounds = true
            textField.keyboardType = .numberPad
            textField.delegate = self
//            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            otpTextFields.append(textField)
            otpStackView.addArrangedSubview(textField)
        }
        
        // Add OTP Stack View to the view
        addSubview(otpStackView)
        
        // Set up constraints using SnapKit
        otpStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
        
        // configure resend button
        
        resendButton.setTitle("send code again in 30s", for: .normal)
        resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        resendButton.setTitleColor(.primaryBlue, for: .normal)
        resendButton.backgroundColor = .systemBackground
        resendButton.titleLabel?.font = .regular16
        
        addSubview(resendButton)
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(otpStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    // MARK: -Timer Methods
    
    @objc private func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            resendButton.setTitle("send code again in \(remainingTime)s", for: .normal)
        } else {
            stopTimer()
            resendButton.isEnabled = true
            resendButton.setTitle("send code again", for: .normal)
        }
    }
    
    private func startTimer() {
        if !isTimerRunning {
            isTimerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
    
    func resetTimer() {
            stopTimer() // Stop the timer if it's running
            remainingTime = 30 // Reset the remaining time to initial duration
            resendButton.setTitle("Send Code Again in \(remainingTime)s", for: .normal)
            resendButton.isEnabled = false
            startTimer() // Restart the timer
        }
    
    // MARK: Button Actions
    
    @objc private func resendButtonTapped() {
        startTimer()
        resendButton.isEnabled = false
        delegate?.didTapResendButton()
        // code implementation for resend OTP
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          // Allow only single digit
          return string.count <= 1
      }
}



