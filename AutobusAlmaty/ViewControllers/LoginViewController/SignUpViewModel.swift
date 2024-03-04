//
//  SignUpViewModel.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 04/03/2024.
//

import Foundation

class SignUpViewModel {
        
    func register(user: User, callback: @escaping (String) -> ()) {
        APICaller.shared.register(user: user) { res in
            switch res {
            case .success(let success):
                print(success)
                callback(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
