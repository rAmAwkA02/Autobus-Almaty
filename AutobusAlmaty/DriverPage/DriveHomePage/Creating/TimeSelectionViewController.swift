//
//  TimeSelectionViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 18/03/2024.
//

import UIKit

class TimeSelectionViewController: UIViewController {
    
    private let datePicker = UIDatePicker()
    private let resetButton = UIButton()
    private let doneButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        
    }
    
    private func configureUI() {
        view.backgroundColor = .primaryGray
        title = "Time"
        
        datePicker.datePickerMode = .time
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [datePicker, resetButton, doneButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(stackView.snp.centerX)
        }
        
        doneButton.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.centerX)
        }
    }
    
    @objc func resetTapped() {
        datePicker.setDate(Date(), animated: true)
    }
    
    @objc func doneTapped() {
//        let selectedTime = datePicker.date
        dismiss(animated: true, completion: nil)
    }
}
