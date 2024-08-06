//
//  HeaderPullsViewSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class HeaderPullsViewSpec: QuickSpec {
    override class func spec() {
        describe("HeaderPullsView") {
            var headerPullsView: HeaderPullsView!
            
            beforeEach {
                headerPullsView = HeaderPullsView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            }
            
            context("when initializing") {
                it("should have a stack view as a subview") {
                    expect(headerPullsView.subviews).to(contain(headerPullsView.titleLabel))
                }
            }
        }
    }
}
