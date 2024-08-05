//
//  DetailsRepoViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation
import UIKit

// MARK: - DetailsRepoNavigationProtocol - Use in Coordinator
protocol DetailsRepoNavigationProtocol: AnyObject {
    func shouldPageRequestPull()
}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol DetailsRepoViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    func setCardPullRequestView() -> CardPullRequestView.Configuration
    func setHeaderPullsView() -> HeaderPullsView.Configuration
    func shouldPageRequestPull()
}

// MARK: - DetailsRepoViewModelProtocol
class DetailsRepoViewModel: DetailsRepoViewModelProtocol {
    private var navigationDelegate: DetailsRepoNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>

    // MARK: - Initialization
    init(navigationDelegate: DetailsRepoNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
    }
    
    func setCardPullRequestView() -> CardPullRequestView.Configuration {
        return CardPullRequestView.Configuration(
            titleAndBodyView: TitleAndBodyView.Configuration(
                textTitle: "Título do pull request",
                textBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
            profileUserPullRequestView: ProfileUserPullRequestView.Configuration(
                profileIcon: Images.Icons.ic_profile,
                userNameText: "username",
                nameText: "Nome Sobrenome")
        )
    }
    
    func setHeaderPullsView() -> HeaderPullsView.Configuration {
        return HeaderPullsView.Configuration(
            openedText: "16",
            closedText: "800"
        )
    }
    
    func shouldPageRequestPull() {
        navigationDelegate.shouldPageRequestPull()
    }
}
