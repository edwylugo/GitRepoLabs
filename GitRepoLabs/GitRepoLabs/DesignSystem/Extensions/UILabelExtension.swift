//
//  UILabelExtension.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

extension UILabel {
    func setAttributedTextWithColor(fullText: String, changeText: String, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: changeText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attributedString
    }
}
