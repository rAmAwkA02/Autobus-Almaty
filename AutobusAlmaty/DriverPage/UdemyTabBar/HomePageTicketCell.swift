//
//  HomePageTicketCell.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 26/03/2024.
//

import Foundation
import UIKit
import SnapKit

class HomePageTicketCell: UITableViewCell {
    
    let containerView: UIView = {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    let startingAndEndingStationNamesLabel: UILabel = {
        $0.font = .bold24
        $0.textColor = .primaryBlue
        return $0
    }(UILabel())
    
    let departureTimeLabel: UILabel = {
        $0.font = .regular18
        return $0
    }(UILabel())
    
    let departureDateLavel: UILabel = {
        $0.font = .regular18
        return $0
    }(UILabel())
    
    
    let arriveTimeLabel: UILabel = {
        $0.font = .regular18
        return $0
    }(UILabel())
    
    let arriveDateLabel: UILabel = {
        $0.font = .regular18
        return $0
    }(UILabel())
    
    lazy var departureVContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [departureTimeLabel, departureDateLavel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var arriveVContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [arriveTimeLabel, arriveDateLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let finalCostLabel: UILabel = {
        $0.font = .bold24
        $0.textColor = .primaryBlue
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePageTicketCell {
    func configure(data: HomeData) {
        startingAndEndingStationNamesLabel.text = data.startingAndEndingStationNames
        departureTimeLabel.text = data.departureTime
        departureDateLavel.text = data.departureDate
        arriveTimeLabel.text = data.arriveTime
        arriveDateLabel.text = data.arriveDate
        finalCostLabel.text = data.finalCost
    }
    
    private func setup() {
        containerView.addSubview(startingAndEndingStationNamesLabel)
        containerView.addSubview(departureVContainer)
        containerView.addSubview(arriveVContainer)
        containerView.addSubview(finalCostLabel)
        contentView.addSubview(containerView)
    }
    
    private func layout() {
        
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(6)
        }
        
        startingAndEndingStationNamesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().offset(8)
        }
        
        departureVContainer.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(startingAndEndingStationNamesLabel.snp.bottom).offset(4)
        }
        
        arriveVContainer.snp.makeConstraints { make in
            make.leading.equalTo(departureVContainer.snp.trailing).offset(8)
            make.top.equalTo(startingAndEndingStationNamesLabel.snp.bottom).offset(4)
        }
        
        finalCostLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(departureDateLavel.snp.bottom).offset(4)
        }
    }
}
