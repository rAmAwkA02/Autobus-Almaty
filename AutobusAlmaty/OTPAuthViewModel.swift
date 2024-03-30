//
//  OTPAuthViewModel.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 26/03/2024.
//

import Foundation

class OTPAuthViewModel {
    var correctOTP: String?
    func confirmToken(callback: @escaping () -> ()) {
        APICaller.shared.confirmToken(token: correctOTP ?? "") { res in
            switch res {
            case .success(let success):
                callback()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

