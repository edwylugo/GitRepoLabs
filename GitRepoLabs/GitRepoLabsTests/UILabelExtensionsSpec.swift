//
//  UILabelExtensionsSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class UILabelExtensionsSpec: QuickSpec {
    override class func spec() {
        describe("UILabel extension") {
            var label: UILabel!
            
            beforeEach {
                label = UILabel()
            }
            
            context("when setting attributed text with color") {
                it("should apply color to the specified text") {
                    let fullText = "Hello, World!"
                    let changeText = "World"
                    let color = UIColor.red
                    
                    label.setAttributedTextWithColor(fullText: fullText, changeText: changeText, color: color)
                    
                    let attributedString = label.attributedText
                    let range = (fullText as NSString).range(of: changeText)
                    
                    expect(attributedString?.string).to(equal(fullText))
                    expect(attributedString?.attributes(at: range.location, effectiveRange: nil)[.foregroundColor] as? UIColor).to(equal(color))
                }
                
                it("should handle empty change text") {
                    let fullText = "Hello, World!"
                    let changeText = ""
                    let color = UIColor.red
                    
                    label.setAttributedTextWithColor(fullText: fullText, changeText: changeText, color: color)
                    
                    let attributedString = label.attributedText
                    expect(attributedString?.string).to(equal(fullText))
                }
                
                it("should handle empty full text") {
                    let fullText = ""
                    let changeText = "Hello"
                    let color = UIColor.red
                    
                    label.setAttributedTextWithColor(fullText: fullText, changeText: changeText, color: color)
                    
                    let attributedString = label.attributedText
                    expect(attributedString?.string).to(equal(fullText))
                }
            }
        }
    }
}
