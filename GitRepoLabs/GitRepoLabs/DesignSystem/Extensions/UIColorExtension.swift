//
//  UIColorExtension.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 04/08/24.
//

import UIKit

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    class func colorGold() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { trait -> UIColor in
                if trait.userInterfaceStyle == .dark {
                    return rgba(218, 165, 32, 1)
                } else {
                    return rgba(218, 165, 32, 1)
                }
            }
        } else {
            return rgba(218, 165, 32, 1)
        }
    }
}
