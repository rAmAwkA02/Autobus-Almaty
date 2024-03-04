//
//  Colors.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/02/2024.
//

import UIKit

// MARK: Hex colors

public extension UIColor {
    convenience init(hex: UInt32) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        guard let intHex = UInt32(hexSanitized, radix: 16) else {
            fatalError("Incorrect string hex")
        }

        self.init(hex: intHex)
    }
}

// MARK: Brighter

public extension UIColor {
    func brighter(_ val: CGFloat) -> UIColor {
        var h: CGFloat = 0.0, s: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: max(0.0, min(b + val, 1.0)), alpha: a)
    }
}

extension UIColor {
    // F8F7F7
    static let primaryGray = UIColor(hex: "F8F7F7")
    
    // 2F4C78
    static let primaryBlue = UIColor(hex: "2F4C78")
    
    //FFFFFF
    static let primaryWhite = UIColor(hex: "FFFFFF")
}
