//
//  AccountSummaryCell.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 23/03/2024.
//

import Foundation
import UIKit
import SnapKit

class AccountSummaryCell: UITableViewCell {
    
    let containerView: UIView = {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    let stationNameLabel = UILabel()
    let arriveTimeLabel = UILabel()
    let departureTimeLabel = UILabel()
    let ticketCostLabel = UILabel()

    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 120
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        
        stationNameLabel.text = "Kaskelen"
        stationNameLabel.font = .bold18
        
        arriveTimeLabel.text = "Arrive time : 12:30"
        arriveTimeLabel.font = .regular18
        
        departureTimeLabel.text = "Departure time: 23:00"
        departureTimeLabel.font = .regular18
        
        ticketCostLabel.text = "1750"
        ticketCostLabel.font = .bold20
        
        
        
        
        contentView.addSubview(containerView)
        containerView.addSubview(stationNameLabel)
        containerView.addSubview(arriveTimeLabel)
        containerView.addSubview(departureTimeLabel)
        containerView.addSubview(ticketCostLabel)
        
    
    }
    
    private func layout() {
        
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(6)
        }
        
        stationNameLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(8)
                make.top.equalToSuperview().offset(8)
            }
        
        arriveTimeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(stationNameLabel.snp.bottom).offset(8)
        }

        departureTimeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(arriveTimeLabel.snp.bottom).offset(4)
        }
        
        ticketCostLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        
    }
}
