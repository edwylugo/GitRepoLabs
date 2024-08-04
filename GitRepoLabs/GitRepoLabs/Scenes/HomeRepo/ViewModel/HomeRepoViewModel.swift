//
//  HomeRepoViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation
import UIKit

// MARK: - HomeRepoNavigationProtocol - Use in Coordinator
protocol HomeRepoNavigationProtocol: AnyObject {
    func shouldDetailsRepo()
}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol HomeRepoViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    func setCardRepoView() -> CardRepoView.Configuration
}

// MARK: - HomeRepoViewModelProtocol
class HomeRepoViewModel: HomeRepoViewModelProtocol {
    private var navigationDelegate: HomeRepoNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>

    // MARK: - Initialization
    init(navigationDelegate: HomeRepoNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
    }
    
    func setCardRepoView() -> CardRepoView.Configuration {
        return CardRepoView.Configuration(
            titleAndBodyView: TitleAndBodyView.Configuration(
                textTitle: "Nome Repositório",
                textBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
            numberForksView: NumbersView.Configuration(
                icon: Images.Icons.ic_forks,
                textNumber: "640"),
            numberStarsView: NumbersView.Configuration(
                icon: Images.Icons.ic_stars,
                textNumber: "85"), 
            profileUserRepoView: ProfileUserRepoView.Configuration(
                profileIcon: Images.Icons.ic_profile,
                userNameText: "username",
                nameText: "Nome Sobrenome")
        )
    }
}
