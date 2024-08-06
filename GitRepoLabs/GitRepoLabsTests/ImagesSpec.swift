//
//  ImagesSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
@testable import GitRepoLabs

class ImagesSpec: QuickSpec {
    override class func spec() {
        describe("Images") {
            context("Icons") {
                it("should have non-nil ic_stars image") {
                    let image = Images.Icons.ic_stars
                    expect(image).notTo(beNil())
                    expect(image.renderingMode).to(equal(.alwaysTemplate))
                }
                
                it("should have non-nil ic_forks image") {
                    let image = Images.Icons.ic_forks
                    expect(image).notTo(beNil())
                    expect(image.renderingMode).to(equal(.alwaysTemplate))
                }
                
                it("should have non-nil ic_profile image") {
                    let image = Images.Icons.ic_profile
                    expect(image).notTo(beNil())
                    expect(image.renderingMode).to(equal(.alwaysOriginal))
                }
                
                it("should have non-nil ic_voltar image") {
                    let image = Images.Icons.ic_voltar
                    expect(image).notTo(beNil())
                    expect(image.renderingMode).to(equal(.alwaysTemplate))
                }
            }
        }
    }
}
