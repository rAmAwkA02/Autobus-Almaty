//
//  RateConfigViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/03/2024.
//

import UIKit

class RateConfigViewController: UIViewController, UITextViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()

        // Do any additional setup after loading the view.
    }
    
    private func configUI() {
        view.backgroundColor = .primaryWhite
        
        let titleLabel = UILabel()
        titleLabel.text = "Creating a route"
        titleLabel.font = .bold20
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(75)
            $0.top.equalToSuperview().offset(105)
        }
                
        let descriptionTextView = UITextView()
        descriptionTextView.font = .bold14
        descriptionTextView.text = "Description"
        descriptionTextView.textColor = .black
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.clipsToBounds = true
        descriptionTextView.layer.cornerRadius = 8.0
        
        descriptionTextView.delegate = self
        
        
        view.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
        
        let routeConfigLabel = UILabel()
        routeConfigLabel.text = "Rate config"
        routeConfigLabel.font = .bold14
        
        let addingRoteConfigButton = UIButton()
        let image = UIImage(systemName: "plus")
        addingRoteConfigButton.setImage(image, for: .normal)
        addingRoteConfigButton.tintColor = .black
        
        let hContainer = UIStackView(arrangedSubviews: [routeConfigLabel, addingRoteConfigButton])
        hContainer.axis = .horizontal
        hContainer.distribution = .equalSpacing
        view.addSubview(hContainer)
        hContainer.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(16)
            $0.size.equalTo(CGSize(width: 150, height: 40))
        }
    }
}


//
//let hContainer = UIStackView(arrangedSubviews: [
//    doneButton, resetButton
//])
//hContainer.axis = .horizontal
//hContainer.distribution = .equalSpacing
//hContainer.snp.makeConstraints {
//    $0.size.equalTo(CGSize(width: 150, height: 40))
//}


