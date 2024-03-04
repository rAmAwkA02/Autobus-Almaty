//
//  LoginViewModel.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 04/03/2024.
//

import Foundation

class LoginViewModel {
    
    func login(user: User, callback: @escaping (String) -> ()) {
        APICaller.shared.login(user: user) { res in
            switch res {
            case .success(let success):
                callback(success)
            case .failure(let failure):
                print(failure)
                callback("This user is already exists")
            }
        }
    }
}
