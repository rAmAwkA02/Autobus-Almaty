//
//  RateConfigViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/03/2024.
//

import UIKit

class RateConfigViewController: UIViewController, UITextViewDelegate, UITableViewDelegate {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupTableView()
        setupKeyboardDismissal()
        setupBackButton()
    }
    
    private func setupBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    
    
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.separatorStyle = .none
    }
    
    private func configUI() {
        
        view.backgroundColor = .primaryWhite
        
        title = "Creating a route"
        
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
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(36)
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
        addingRoteConfigButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        
        let hContainer = UIStackView(arrangedSubviews: [routeConfigLabel, addingRoteConfigButton])
        hContainer.axis = .horizontal
        hContainer.distribution = .equalSpacing
        view.addSubview(hContainer)
        hContainer.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(16)
            $0.size.equalTo(CGSize(width: 150, height: 40))
        }
        
        let createButton = UIButton()
        createButton.setTitle("Create", for: .normal)
        createButton.backgroundColor = .primaryBlue
        createButton.clipsToBounds = true
        createButton.layer.cornerRadius = 8
        createButton.titleLabel?.font = .medium16
        createButton.setTitleColor(.primaryWhite, for: .normal)
        view.addSubview(createButton)
        
        createButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
            $0.height.equalTo(40)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(hContainer.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalTo(createButton.snp.top).offset(-8)
        }
        
    }
    
    private func setupKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func didTapPlusButton() {
        let vc = CreateStationViewController()
        present(vc, animated: true)
    }
    
    @objc func backButtonTapped() {
        // Handle the back action, e.g., pop the view controller
        navigationController?.popViewController(animated: true)
    }
}

extension RateConfigViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath)
        as! AccountSummaryCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension RateConfigViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // Handle cell selection
    }
}




