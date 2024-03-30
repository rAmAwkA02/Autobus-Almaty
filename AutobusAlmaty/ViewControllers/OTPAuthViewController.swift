//
//  ConfirmCodeViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/02/2024.
//

import UIKit

class OTPAuthViewController: UIViewController {
    private let otpStackView = OTPStackView()
    private var timer: Timer?
    private var remainingTime = 30 // duration in seconds
    private var isTimerRunning = false
    private var correctOTP: String?
    private var viewModel: OTPAuthViewModel = OTPAuthViewModel()

    private let confirmCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirmation Code"
        label.textColor = .primaryBlue
        label.font = .bold28
        label.textAlignment = .center
        return label
    }()
    
    private let smsInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "We've sent an SMS with an activation code to your phone +8 747 537 6302"
        label.textAlignment = .center
        label.textColor = .primaryBlue
        label.font = .regular16
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var resendButton: UIButton = {
        $0.setTitle("send code again in 30s", for: .normal)
        $0.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        $0.setTitleColor(.primaryBlue, for: .normal)
        $0.backgroundColor = .systemBackground
        $0.titleLabel?.font = .regular16
        return $0
    }(UIButton())
    
    init(correctOTP: String) {
        self.correctOTP = correctOTP
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhite
        otpStackView.delegate = self
        
        confirgureView()
        setupConstrain()
        startTimer()
    }
    
    private func confirgureView() {
        [confirmCodeLabel, smsInfoLabel, otpStackView, resendButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstrain() {
        
        confirmCodeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(195)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        smsInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(confirmCodeLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        otpStackView.snp.makeConstraints { make in
            make.top.equalTo(smsInfoLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(otpStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    func didVerifyOTP(_ otp: String) {
        if otp == correctOTP {
            viewModel.confirmToken {
                DispatchQueue.main.async { [weak self] in
                    self?.navigateToNextViewController()
                }
            }
        } else {
            print("OTP verification failed")
            showErrorOTPAlert()
            // Perform actions for failed verification, such as displaying an error message
            
        }
    }
    
    private func showErrorOTPAlert() {
        let alertController = UIAlertController(title: "Error", message: "Wrong code!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { alert in
            self.clearOtp()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func clearOtp() {
        otpStackView.clearTextFields()
    }
    
    func didTapResendButton() {
        resendOTP()
    }
    
    func resendOTP() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            // Hide loading indicator after delay
            // Reset the timer in OTPAuthenticationView
            
        }
    }
    
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
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
            resendButton.setTitle("send Code Again in \(remainingTime)s", for: .normal)
            resendButton.isEnabled = false
            startTimer() // Restart the timer
        }
    
    @objc private func resendButtonTapped() {
        resendButton.isEnabled = false
        resetTimer()
//        delegate?.didTapResendButton()
        // code implementation for resend OTP
    }
    
}


extension OTPAuthViewController: OTPDelegate {
    
    func navigateToNextViewController() {
        let nextViewController = StartViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func didChangeValidity(isValid: Bool, otp: String) {
        if isValid {
            didVerifyOTP(otp)
        }
    }
}
