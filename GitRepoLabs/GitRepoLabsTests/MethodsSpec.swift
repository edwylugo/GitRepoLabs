//
//  MethodsSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
@testable import GitRepoLabs

class MethodsSpec: QuickSpec {
    override class func spec() {
        describe("Methods enum") {
            context("when calling call() on each method") {
                it("should return the correct string for GET") {
                    let method: Methods = .get
                    expect(method.call()).to(equal("GET"))
                }

                it("should return the correct string for POST") {
                    let method: Methods = .post
                    expect(method.call()).to(equal("POST"))
                }

                it("should return the correct string for PUT") {
                    let method: Methods = .put
                    expect(method.call()).to(equal("PUT"))
                }

                it("should return the correct string for JSON") {
                    let method: Methods = .json
                    expect(method.call()).to(equal("JSON"))
                }

                it("should return the correct string for DELETE") {
                    let method: Methods = .delete
                    expect(method.call()).to(equal("DELETE"))
                }

                it("should return the correct string for PATCH") {
                    let method: Methods = .patch
                    expect(method.call()).to(equal("PATCH"))
                }
            }
        }
    }
}
