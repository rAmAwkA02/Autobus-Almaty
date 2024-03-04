//
//  OTPTextField.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 28/02/2024.
//

import Foundation
import UIKit

class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override public func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}
