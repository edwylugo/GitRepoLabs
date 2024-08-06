//
//  DetailsRepoViewModelSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
import UIKit
@testable import GitRepoLabs

class DetailsRepoViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: DetailsRepoViewModel!
        var mockNavigation: MockDetailsRepoNavigation!
        
        beforeEach {
            mockNavigation = MockDetailsRepoNavigation()
            let mockRepository = repository
            viewModel = DetailsRepoViewModel(navigationDelegate: mockNavigation, repository: mockRepository)
        }
        
        describe("DetailsRepoViewModel") {
            context("when pull request data is available") {
                beforeEach {
                    // Simula a resposta bem-sucedida da API
                    let mockResponse = [pullRequestModel]
                    let jsonResult = NSMutableArray(array: mockResponse.map { $0.toDictionary() })
                    
                    viewModel.wsFinishedWithSuccess(identifier: .listPullRequest, sender: NSDictionary(), status: .success, jsonResult: jsonResult)
                }
                
                it("should configure CardPullRequestView correctly") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    let config = viewModel.setCardPullRequestView(indexPath: indexPath)
                    
                    let data = viewModel.pullRequestModel.value[indexPath.row]
                    
                    expect(config.titleAndBodyView.textTitle).to(equal(data.title))
                    expect(config.titleAndBodyView.textBody).to(equal(data.body))
                    
                    expect(config.profileUserPullRequestView.userNameText).to(equal(data.user?.login))
                    expect(config.profileUserPullRequestView.nameText).to(equal(data.user?.type))
                    if let expectedURL = URL(string: data.user?.avatarUrl ?? "") {
                        expect(config.profileUserPullRequestView.avatarURL).to(equal(expectedURL))
                    } else {
                        expect(config.profileUserPullRequestView.avatarURL).to(beNil())
                    }
                }
            }
        }
    }
}

extension PullRequestModel {
    func toDictionary() -> [String: Any] {
        return [
            "id": self.id ?? "",
            "title": self.title ?? "",
            "body": self.body ?? "",
            "state": self.state ?? "",
            "user": [
                "login": self.user?.login ?? "",
                "type": self.user?.type ?? "",
                "avatarUrl": self.user?.avatarUrl ?? ""
            ]
        ]
    }
}

class MockDetailsRepoNavigation: DetailsRepoNavigationProtocol {
    var didCallShouldPageRequestPull = false
    var urlStringPassed: String?
    
    func shouldPageRequestPull(urlString: String) {
        didCallShouldPageRequestPull = true
        urlStringPassed = urlString
    }
}
