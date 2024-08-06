//
//  UITableViewExtensionsSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class UITableViewExtensionsSpec: QuickSpec {
    override class func spec() {
        
        describe("UITableView extension") {
            var tableView: UITableView!
            
            beforeEach {
                tableView = UITableView()
            }
            
            context("when registering cells") {
                it("should register a cell class correctly") {
                    tableView.register(cellClass: UITableViewCell.self)
                    let cell = tableView.dequeue(cellClass: UITableViewCell.self, indexPath: IndexPath(row: 0, section: 0))
                    expect(cell).toNot(beNil())
                }
                
                it("should register a header view class correctly") {
                    class MockHeaderView: UITableViewHeaderFooterView {}
                    tableView.registerHeader(cellClass: MockHeaderView.self)
                    let headerView = tableView.dequeueHeader(viewClass: MockHeaderView.self)
                    expect(headerView).toNot(beNil())
                }
            }
            
            context("when dequeuing cells") {
                beforeEach {
                    tableView.register(cellClass: UITableViewCell.self)
                }
                
                it("should dequeue a registered cell class correctly") {
                    let cell = tableView.dequeue(cellClass: UITableViewCell.self, indexPath: IndexPath(row: 0, section: 0))
                    expect(cell).to(beAnInstanceOf(UITableViewCell.self))
                }
                
                it("should throw fatal error for unregistered header view class") {
                    class UnregisteredHeaderView: UITableViewHeaderFooterView {}
                    expect {
                        _ = tableView.dequeueHeader(viewClass: UnregisteredHeaderView.self)
                    }.to(throwAssertion())
                }
            }
            
            context("when dequeuing header views") {
                beforeEach {
                    tableView.registerHeader(cellClass: MockHeaderView.self)
                }
                
                it("should dequeue a registered header view class correctly") {
                    let headerView = tableView.dequeueHeader(viewClass: MockHeaderView.self)
                    expect(headerView).to(beAnInstanceOf(MockHeaderView.self))
                }
            }
        }
    }
}

class MockHeaderView: UITableViewHeaderFooterView {}
