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
}
