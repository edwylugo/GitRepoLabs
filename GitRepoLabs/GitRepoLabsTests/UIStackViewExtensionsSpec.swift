//
//  UIStackViewExtensionsSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class UIStackViewExtensionsSpec: QuickSpec {
    override class func spec() {
        describe("UIStackView extension") {
            var stackView: UIStackView!
            
            beforeEach {
                stackView = UIStackView()
                stackView.axis = .vertical
            }
            
            context("when adding arranged subviews") {
                it("should add the subviews to the stack view") {
                    let view1 = UIView()
                    let view2 = UIView()
                    stackView.addArrangedSubviews([view1, view2])
                    
                    expect(stackView.arrangedSubviews).to(contain(view1))
                    expect(stackView.arrangedSubviews).to(contain(view2))
                }
            }
            
            context("when removing a view fully") {
                it("should remove the view from the stack view and superview") {
                    let view = UIView()
                    stackView.addArrangedSubview(view)
                    stackView.removeFully(view: view)
                    
                    expect(stackView.arrangedSubviews).toNot(contain(view))
                    expect(view.superview).to(beNil())
                }
            }
            
            context("when removing all arranged subviews") {
                it("should remove all arranged subviews from the stack view and their superviews") {
                    let view1 = UIView()
                    let view2 = UIView()
                    stackView.addArrangedSubviews([view1, view2])
                    stackView.removeFullyAllArrangedSubviews()
                    
                    expect(stackView.arrangedSubviews).to(beEmpty())
                    expect(view1.superview).to(beNil())
                    expect(view2.superview).to(beNil())
                }
            }
        }
    }
}
