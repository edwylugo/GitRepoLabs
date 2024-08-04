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
    func setTitleAndBodyView() -> TitleAndBodyView.Configuration
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
    
    func setTitleAndBodyView() -> TitleAndBodyView.Configuration {
        return TitleAndBodyView.Configuration(textTitle: "Nome Repositório",
                                              textBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa")
    }
}
