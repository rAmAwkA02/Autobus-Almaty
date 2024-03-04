//
//  Fonts.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 21/02/2024.
//

import UIKit

public extension UIFont {
    // MARK: Poppins-Bold
    
    static var bold10: UIFont { (boldFont(10)) }
    static var bold12: UIFont { (boldFont(12)) }
    static var bold14: UIFont { (boldFont(14)) }
    static var bold16: UIFont { (boldFont(16)) }
    static var bold18: UIFont { (boldFont(18)) }
    static var bold20: UIFont { (boldFont(20)) }
    static var bold24: UIFont { (boldFont(24)) }
    static var bold28: UIFont { (boldFont(28)) }
    static var bold30: UIFont { (boldFont(30)) }
    static var bold32: UIFont { (boldFont(32)) }
    
    // MARK: Poppins-Light
    
    static var light10: UIFont { (lightFont(10)) }
    static var light12: UIFont { (lightFont(12)) }
    static var light14: UIFont { (lightFont(14)) }
    static var light16: UIFont { (lightFont(16)) }
    static var light18: UIFont { (lightFont(18)) }
    static var light20: UIFont { (lightFont(20)) }
    static var light24: UIFont { (lightFont(24)) }
    static var light28: UIFont { (lightFont(28)) }
    
    // MARK: Poppins-Regular
    
    static var regular10: UIFont { (regularFont(10)) }
    static var regular12: UIFont { (regularFont(12)) }
    static var regular14: UIFont { (regularFont(14)) }
    static var regular16: UIFont { (regularFont(16)) }
    static var regular18: UIFont { (regularFont(18)) }
    static var regular20: UIFont { (regularFont(20)) }
    static var regular24: UIFont { (regularFont(24)) }
    static var regular28: UIFont { (regularFont(28)) }
    
    // MARK: Poppins-Medium
    
    static var medium10: UIFont { (mediumFont(10)) }
    static var medium12: UIFont { (mediumFont(12)) }
    static var medium14: UIFont { (mediumFont(14)) }
    static var medium16: UIFont { (mediumFont(16)) }
    static var medium18: UIFont { (mediumFont(18)) }
    static var medium20: UIFont { (mediumFont(20)) }
    static var medium24: UIFont { (mediumFont(24)) }
    static var medium28: UIFont { (mediumFont(28)) }
    
    private static func lightFont(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Light", size: size) else {
            fatalError(
                """
                Failed to load the "FuturaPT-Book" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return font
    }
    
    private static func boldFont(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Bold", size: size) else {
            fatalError(
                """
                Failed to load the "FuturaPT-Book" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return font
    }
    
    private static func regularFont(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Regular", size: size) else {
            fatalError(
                """
                Failed to load the "FuturaPT-Book" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return font
    }
    
    private static func mediumFont(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Medium", size: size) else {
            fatalError(
                """
                Failed to load the "FuturaPT-Book" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return font
    }

}

