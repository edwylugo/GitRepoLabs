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

}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol DetailsRepoViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
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
}
