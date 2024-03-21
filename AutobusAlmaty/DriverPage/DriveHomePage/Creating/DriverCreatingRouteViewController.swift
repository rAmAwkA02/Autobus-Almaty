//
//  DriverAddingRouteViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 17/03/2024.
//

import UIKit
import SnapKit
import HorizonCalendar

final class DriverCreatingRouteViewController: UIViewController {

    private var selectedDate: Day?
    
    private let viewModel = DriverCreatingRouteViewModel()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private var timeLabel: UILabel!
    private var locationLabel: UILabel!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Creating a route"
        label.textColor = .primaryBlue
        label.font = .bold30
        return label
    }()
    
    private var timeButton: UIButton!
    private var dateButton: UIButton!
    private var locationButton: UIButton!
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .primaryBlue
        label.font = .bold16
        return label
    }()
    
    private let dateImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "dateImage")
        return image
    }()
    
    private var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.backgroundColor = .primaryBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .medium16
        button.setTitleColor(.primaryWhite, for: .normal)
        button.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    @objc
    func fromTextFieldTapped() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configUI() {
        view.backgroundColor = .primaryWhite
        view.addSubview(stackView)
        
        timeButton = makeButton()
        locationButton = makeButton()
        dateButton = makeButton()
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        dateButton.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        dateButton.addSubview(dateImage)
        dateImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        horizontalStackView.addArrangedSubview(dateButton)
        horizontalStackView.addArrangedSubview(timeButton)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(locationButton)
        stackView.addArrangedSubview(horizontalStackView)
        stackView.addArrangedSubview(createButton)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        locationButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        dateButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        timeButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        createButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        timeLabel = UILabel()
        timeLabel.text = "Time"
        timeLabel.isUserInteractionEnabled = false
        timeLabel.font = .bold16
        timeLabel.textColor = .primaryBlue
        timeButton.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        locationLabel = UILabel()
        locationLabel.text = "From"
        locationLabel.isUserInteractionEnabled = false
        locationLabel.font = .bold16
        locationLabel.textColor = .primaryBlue
        locationButton.addSubview(locationLabel)
        locationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        locationButton.addTarget(self, action: #selector(didTapLocation), for: .touchUpInside)
        dateButton.addTarget(self, action: #selector(didTapDate), for: .touchUpInside)
        timeButton.addTarget(self, action: #selector(didTapTime), for: .touchUpInside)
//        createButton.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)
        
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        return button
    }
    
    // MARK: Actions
    @objc private func didTapLocation() {
        let vc = LocationChooseViewController()
        present(vc, animated: true)
    }
    
    @objc private func didTapDate() {
        let vc = DateSelectionCalendarViewController()
        vc.selectedDay = self.selectedDate
        vc.didSelectDay = { [weak self] day in
            self?.selectedDate = day
            self?.dateLabel.text = day.description
        }
        present(vc, animated: true)
    }
    
    @objc private func didTapTime() {
        let vc = TimeSelectionViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc private func didTapCreate() {
        let vc = RateConfigViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DriverCreatingRouteViewController: TimeSelectionDelegate {
    
    func didSelect(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let formattedDateString = dateFormatter.string(from: date)
        timeLabel.text = formattedDateString
    }
}
