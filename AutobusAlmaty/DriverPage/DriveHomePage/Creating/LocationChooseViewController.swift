//
//  LocationChooseViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 18/03/2024.
//

import UIKit

protocol LocationChooseDelegate: AnyObject {
    func didSelectLocation(with: String)
}

final class LocationChooseViewController: UIViewController {
    
    private enum Constants {
        static let padding: CGFloat = 16
    }
    
    weak var delegate: LocationChooseDelegate?
    
    private let viewModel = LocationChooseViewModel()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "City or station"
        textField.layer.borderWidth = 0.55
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        paddingView.backgroundColor = .clear
        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.contentMode = .center
        imageView.tintColor = .gray
        imageView.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
        paddingView.addSubview(imageView)
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .primaryGray
        
        let label = UILabel()
        label.text = "From"
        label.font = .bold16
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(Constants.padding)
        }
        
        textField.delegate = self
        view.addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(Constants.padding)
            $0.height.equalTo(36)
        }
    }
}

extension LocationChooseViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        textField.resignFirstResponder()
        viewModel.fetchLocation(text: text) { result in
            print(result)
        }
        return true
    }
}
