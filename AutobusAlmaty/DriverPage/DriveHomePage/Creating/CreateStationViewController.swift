//
//  CreateStationViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/03/2024.
//

import UIKit

class CreateStationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // UI
    private func configUI() {
        view.backgroundColor = .primaryWhite
        
        let titleLabel = UILabel()
        titleLabel.text = "Rate Config"
        titleLabel.font = .bold16
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        let stationNameTextField = UITextField()
        stationNameTextField.translatesAutoresizingMaskIntoConstraints = false
        stationNameTextField.backgroundColor = .primaryWhite
        stationNameTextField.clipsToBounds = true
        stationNameTextField.layer.cornerRadius = 8
        stationNameTextField.font = .medium16
        stationNameTextField.autocapitalizationType = .none
        stationNameTextField.placeholder = "Station name"
        stationNameTextField.layer.borderWidth = 1
        
        view.addSubview(stationNameTextField)
        stationNameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
            $0.height.equalTo(40)
        }
        
        let departureTimeTextField = UITextField()
        departureTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        departureTimeTextField.backgroundColor = .primaryWhite
        departureTimeTextField.clipsToBounds = true
        departureTimeTextField.layer.cornerRadius = 8
        departureTimeTextField.font = .medium16
        departureTimeTextField.autocapitalizationType = .none
        departureTimeTextField.placeholder = "Departure time"
        departureTimeTextField.layer.borderWidth = 1
        
        let arriveTimeTextField = UITextField()
        arriveTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        arriveTimeTextField.backgroundColor = .primaryWhite
        arriveTimeTextField.clipsToBounds = true
        arriveTimeTextField.layer.cornerRadius = 8
        arriveTimeTextField.font = .medium16
        arriveTimeTextField.autocapitalizationType = .none
        arriveTimeTextField.placeholder = "Arrive time"
        arriveTimeTextField.layer.borderWidth = 1
        
        [departureTimeTextField, arriveTimeTextField].forEach { textField in
            textField.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }
        
        let hContainer = UIStackView(arrangedSubviews: [departureTimeTextField, arriveTimeTextField])
        hContainer.axis = .horizontal
        hContainer.distribution = .fillEqually
        hContainer.alignment = .center
        hContainer.spacing = 8
        view.addSubview(hContainer)
        hContainer.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(stationNameTextField.snp.bottom).offset(16)
            $0.height.equalTo(40)
        }
        
        let costTextField = UITextField()
        costTextField.translatesAutoresizingMaskIntoConstraints = false
        costTextField.backgroundColor = .primaryWhite
        costTextField.clipsToBounds = true
        costTextField.layer.cornerRadius = 8
        costTextField.font = .medium16
        costTextField.autocapitalizationType = .none
        costTextField.placeholder = "Cost"
        costTextField.layer.borderWidth = 1
        
        view.addSubview(costTextField)
        costTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(hContainer.snp.bottom).offset(16)
            $0.height.equalTo(40)
        }
        
        let createButton = UIButton()
        createButton.setTitle("Create a station", for: .normal)
        createButton.backgroundColor = .primaryBlue
        createButton.clipsToBounds = true
        createButton.layer.cornerRadius = 8
        createButton.titleLabel?.font = .medium16
        createButton.setTitleColor(.primaryWhite, for: .normal)
        view.addSubview(createButton)
        
        createButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(costTextField.snp.bottom).offset(16)
            $0.height.equalTo(40)
            
        }
            
    }
}
