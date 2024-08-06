//
//  CardPullRequestViewSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class CardPullRequestViewSpec: QuickSpec {
    override class func spec() {
        describe("CardPullRequestView") {
            var cardPullRequestView: CardPullRequestView!
            
            beforeEach {
                cardPullRequestView = CardPullRequestView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            }
            
            context("when initializing") {
                it("should have a stack view as a subview") {
                    expect(cardPullRequestView.subviews).to(contain(cardPullRequestView.stackView))
                }
            }
        }
    }
}
