//
//  SignUpViewModel.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 04/03/2024.
//

import Foundation

class SignUpViewModel {
    
    var user: String?
    func register(user: User, callback: @escaping (UserREST) -> ()) {
        APICaller.shared.register(user: user) { res in
            switch res {
            case .success(let success):
                callback(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func resend(user: User, callback: @escaping (String) -> ()) {
        APICaller.shared.resend(user: user) { res in
            switch res {
            case .success(let success):
                callback(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
