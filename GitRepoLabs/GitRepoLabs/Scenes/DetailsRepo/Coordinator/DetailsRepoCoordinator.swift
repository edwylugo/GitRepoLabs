//
//  DetailsRepoCoordinator.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

protocol DetailsRepoCoordinatorProtocol: Coordinator {
    func sceneDetailsRepo(repository: RepositoryModel)
}

class DetailsRepoCoordinator: DetailsRepoCoordinatorProtocol {

    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .detailsRepo }
    
    func start() {
        
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func sceneDetailsRepo(repository: RepositoryModel) {
        let viewModel = DetailsRepoViewModel(navigationDelegate: self, repository: repository)
        let controller = DetailsRepoController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - DetailsRepoNavigationProtocol
extension DetailsRepoCoordinator: DetailsRepoNavigationProtocol {
    func shouldPageRequestPull(urlString: String) {
        let coordinator = PagePullRequestCoordinator(navigationController)
        coordinator.scenePagePullRequest(urlString: urlString)
    }
}
