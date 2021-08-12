//
//  UIColor+Utils.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 9/07/21.
//

import UIKit

extension UIColor {
    
    class var black10: UIColor { // #F2F2F2
        return UIColor( red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    class var blue700: UIColor { // #003F8C
        return UIColor( red: 0/255, green: 63/255, blue: 140/255, alpha: 1.0)
    }
    
    class var green100: UIColor { // #B8EBD6
        return UIColor( red: 184/255, green: 235/255, blue: 214/255, alpha: 1.0)
    }
    
    class var green500: UIColor { // #1BC47C
        return UIColor( red: 27/255, green: 196/255, blue: 124/255, alpha: 1.0)
    }
}

extension UIColor {
    
    /// Retrieve uicolor from hexa-color
    /// - Parameter hex: Hexa-color, example: #225509
    static func hexStringToUIColor(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
