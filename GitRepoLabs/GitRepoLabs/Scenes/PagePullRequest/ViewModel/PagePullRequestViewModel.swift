//
//  PagePullRequestViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation
import UIKit

// MARK: - PagePullRequestNavigationProtocol - Use in Coordinator
protocol PagePullRequestNavigationProtocol: AnyObject {

}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol PagePullRequestViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var urlString: String? { get }
}

// MARK: - PagePullRequestViewModelProtocol
class PagePullRequestViewModel: PagePullRequestViewModelProtocol {
    private var navigationDelegate: PagePullRequestNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var urlString: String?

    // MARK: - Initialization
    init(navigationDelegate: PagePullRequestNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.urlString = "https://github.com/"
    }
}
