//
//  UIColorExtensionsSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class UIColorExtensionsSpec: QuickSpec {
    override class func spec() {
        describe("UIColor extension") {
            
            context("when creating color with rgba(_:_:_:_)") {
                it("should return correct color for red") {
                    let color = UIColor.rgba(255, 0, 0, 1)
                    expect(color.cgColor.components).to(equal([1.0, 0.0, 0.0, 1.0]))
                }
                
                it("should return correct color for green") {
                    let color = UIColor.rgba(0, 255, 0, 1)
                    expect(color.cgColor.components).to(equal([0.0, 1.0, 0.0, 1.0]))
                }
                
                it("should return correct color for blue") {
                    let color = UIColor.rgba(0, 0, 255, 1)
                    expect(color.cgColor.components).to(equal([0.0, 0.0, 1.0, 1.0]))
                }
                
                it("should return correct color with alpha") {
                    let color = UIColor.rgba(255, 0, 0, 0.5)
                    expect(color.cgColor.components).to(equal([1.0, 0.0, 0.0, 0.5]))
                }
            }
            
            context("when getting colorGold()") {
                it("should return gold color") {
                    let color = UIColor.colorGold()
                    expect(color.cgColor.components).to(equal([0.8549019607843137, 0.6470588235294118, 0.12549019607843137, 1.0]))
                }
            }
        }
    }
}
