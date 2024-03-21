//
//  TimeSelectionViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 18/03/2024.
//

import UIKit

protocol TimeSelectionDelegate: AnyObject {
    func didSelect(date: Date)
}

final class TimeSelectionViewController: UIViewController {

    weak var delegate: TimeSelectionDelegate?
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // UI
    private func configUI() {
        view.backgroundColor = .primaryWhite

        let doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.primaryBlue, for: .normal)
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        
        let resetButton = UIButton()
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.primaryBlue, for: .normal)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        
        let hContainer = UIStackView(arrangedSubviews: [
            doneButton, resetButton
        ])
        hContainer.axis = .horizontal
        hContainer.distribution = .equalSpacing
        hContainer.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 150, height: 40))
        }
        
        datePicker.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 150, height: 150))
        }
        
        let vContainer = UIStackView(arrangedSubviews: [
            datePicker, hContainer
        ])
        vContainer.axis = .vertical
        view.addSubview(vContainer)
        vContainer.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Time"
        titleLabel.font = .bold16
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
        }
    }
    
    // Actions
    @objc func resetTapped() {
        datePicker.setDate(Date(), animated: true)
    }
    
    @objc func doneTapped() {
        #warning("TODO: output of this view controller, delegate")
        delegate?.didSelect(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
