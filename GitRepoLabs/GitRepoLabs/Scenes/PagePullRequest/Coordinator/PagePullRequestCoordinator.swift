//
//  PagePullRequestCoordinator.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

protocol PagePullRequestCoordinatorProtocol: Coordinator {
    func scenePagePullRequest()
}

class PagePullRequestCoordinator: PagePullRequestCoordinatorProtocol {

    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .pagePulRequest }
    
    func start() {
        scenePagePullRequest()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func scenePagePullRequest() {
        let viewModel = PagePullRequestViewModel(navigationDelegate: self)
        let controller = PagePullRequestController(viewModel: viewModel)
        navigationController.present(controller, animated: true)
    }
}

// MARK: - PagePullRequestNavigationProtocol
extension PagePullRequestCoordinator: PagePullRequestNavigationProtocol {
    
}
