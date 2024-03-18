//
//  LocationChooseViewModel.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 18/03/2024.
//

import UIKit

final class LocationChooseViewModel {
    
    func fetchLocation(text: String?, completion: @escaping ((String) -> ())) {
        
        let result = "Maiami"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(result)
        }
    }
}
