//
//  PrimaryButton.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 22/02/2024.
//

import UIKit

class PrimaryButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: 50)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        clipsToBounds = true
        layer.cornerRadius = 8
        titleLabel?.font = .medium16
        setTitleColor(.primaryWhite, for: .normal)
        backgroundColor = .primaryBlue
    }
    
}
