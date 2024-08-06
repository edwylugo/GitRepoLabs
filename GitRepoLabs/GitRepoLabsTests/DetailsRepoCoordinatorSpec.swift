//
//  DetailsRepoCoordinatorSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class DetailsRepoCoordinatorSpec: QuickSpec {
    override class func spec() {
        describe("DetailsRepoCoordinator") {
            var navigationController: UINavigationController!
            var coordinator: DetailsRepoCoordinator!
            
            beforeEach {
                navigationController = UINavigationController()
                coordinator = DetailsRepoCoordinator(navigationController)
            }
            
            context("when start is called") {
                it("should not affect the navigation stack initially") {
                    coordinator.start()
                    expect(navigationController.viewControllers.count).to(equal(0))
                }
            }
            
            context("when sceneDetailsRepo is called") {
                it("should push DetailsRepoController into the navigation stack") {
                    expect(navigationController.viewControllers.count).to(equal(0))
                    
                    let repository = repository

                    coordinator.sceneDetailsRepo(repository: repository)
                
                    expect(navigationController.viewControllers.count).to(equal(1))
                    expect(navigationController.viewControllers.first).to(beAnInstanceOf(DetailsRepoController.self))
                }
            }
            
            context("when shouldPageRequestPull is called") {
                it("should push a new coordinator onto the navigation stack") {
                    let urlString = "https://example.com/pull/1"
                    coordinator.shouldPageRequestPull(urlString: urlString)
                    let topController = navigationController.topViewController
                    expect(topController).to(beNil())
                }
            }
            
            context("when shouldPageRequestPull is not called") {
                it("should have a nil top view controller if no other operations were performed") {
                    let topController = navigationController.topViewController
                    expect(topController).to(beNil())
                }
            }
        }
    }
}
