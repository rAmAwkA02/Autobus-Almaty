//
//  DriversRoutesAndCheckingViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 27/03/2024.
//

import UIKit

class DriversRoutesAndCheckingViewController: UIViewController, UITextViewDelegate, UITableViewDelegate {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        configUI()
        setupTableView()
    }
    
    private func setupBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let backTitleLabel = UILabel()
        backTitleLabel.text = "Almaty - Shymkent" // TODO:
        backTitleLabel.font = .medium18
        backButton.addSubview(backTitleLabel)
        
        backTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.left.equalTo(backButton.imageView!.snp.right).offset(8)
        }

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RateConfigCell.self, forCellReuseIdentifier: RateConfigCell.reuseID)
        tableView.rowHeight = RateConfigCell.rowHeight
        tableView.separatorStyle = .none
    }
    
    
    private func configUI() {
        
        view.backgroundColor = .primaryWhite
        
        let busImageView = UIImageView()
        busImageView.image = UIImage(named: "busImage")
        busImageView.clipsToBounds = true
        busImageView.layer.cornerRadius = 8
        view.addSubview(busImageView)
        busImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.width.equalTo(350)
            make.height.equalTo(200)
        }
        
        let descriptionTextView = UITextView()
        descriptionTextView.font = .medium14
        descriptionTextView.text = ""
        descriptionTextView.isUserInteractionEnabled = false
        descriptionTextView.textColor = .black
        descriptionTextView.clipsToBounds = true
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.primaryBlue.cgColor
        descriptionTextView.layer.cornerRadius = 8
        
        descriptionTextView.delegate = self
        
        view.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(busImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
        
        let rateConfigLabel = UILabel()
        rateConfigLabel.text = "Rate config"
        rateConfigLabel.font = .bold14
        rateConfigLabel.textColor = .primaryBlue
        view.addSubview(rateConfigLabel)
        rateConfigLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(rateConfigLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
        
        let routesButton = PrimaryButton()
        routesButton.setTitle("Routes", for: .normal)
        
        let checkingButton = PrimaryButton()
        checkingButton.setTitle("Checking", for: .normal)
        
        let hContainer = UIStackView(arrangedSubviews: [routesButton, checkingButton])
        hContainer.axis = .horizontal
        hContainer.distribution = .fillEqually
        hContainer.alignment = .center
        hContainer.spacing = 8
        view.addSubview(hContainer)
        hContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(40)
            // TODO: routes and checking button not corrected with place
        }
        
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }    
}

extension DriversRoutesAndCheckingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RateConfigCell.reuseID, for: indexPath)
        as! RateConfigCell
        
        let stationData = dictionary.data[indexPath.row]
        cell.stationNameLabel.text = stationData[0]
        cell.arriveTimeLabel.text = stationData[1]
        cell.departureTimeLabel.text = stationData[2]
        cell.ticketCostLabel.text = stationData[3]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.data.count
    }
}

extension DriversRoutesAndCheckingViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // Handle cell selection
    }
}

