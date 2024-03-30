//
//  DriverHomeViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 17/03/2024.
//

import UIKit
import SnapKit

struct HomeData {
    var departureTime: String
    var departureDate: String
    var startingAndEndingStationNames: String
    let arriveTime: String
    let arriveDate: String
    let finalCost: String
}

class DriverHomeViewController: UIViewController {
    
    var data: [HomeData] = [HomeData(departureTime: "8:30", departureDate: "12 march", startingAndEndingStationNames: "Almaty - Kyzylorda", arriveTime: "18:30", arriveDate: "13 march", finalCost: "15000"), HomeData(departureTime: "8:30", departureDate: "12 march", startingAndEndingStationNames: "Almaty - Kyzylorda", arriveTime: "18:30", arriveDate: "13 march", finalCost: "14000"), HomeData(departureTime: "8:30", departureDate: "12 march", startingAndEndingStationNames: "Almaty - Kyzylorda", arriveTime: "18:30", arriveDate: "13 march", finalCost: "18800")]
    var tableView = UITableView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupTableView()
    
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomePageTicketCell.self, forCellReuseIdentifier: "HomePageTicketCell")
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        
    }
    
    private func configUI() {
        
        view.backgroundColor = .primaryWhite
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
}

extension DriverHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTicketCell", for: indexPath)
        as! HomePageTicketCell
        cell.configure(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DriversRoutesAndCheckingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
