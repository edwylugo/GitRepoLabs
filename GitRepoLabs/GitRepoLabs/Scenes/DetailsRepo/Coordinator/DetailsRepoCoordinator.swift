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
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigationController.topViewController?.present(alert, animated: true, completion: nil)
    }
}

// MARK: - DetailsRepoNavigationProtocol
extension DetailsRepoCoordinator: DetailsRepoNavigationProtocol {
    func shouldError(message: String) {
        showMessage(withTitle: "Error", message: message)
    }
    
    func shouldPageRequestPull(urlString: String) {
        let coordinator = PagePullRequestCoordinator(navigationController)
        coordinator.scenePagePullRequest(urlString: urlString)
    }
}
