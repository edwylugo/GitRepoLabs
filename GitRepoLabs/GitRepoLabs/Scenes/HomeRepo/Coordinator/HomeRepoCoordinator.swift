//
//  HomeRepoCoordinator.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

protocol HomeRepoCoordinatorProtocol: Coordinator {
    func sceneHomeRepo()
}

class HomeRepoCoordinator: HomeRepoCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .homeRepo }
    
    func start() {
        sceneHomeRepo()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func sceneHomeRepo() {
        let viewModel = HomeRepoViewModel(navigationDelegate: self)
        let controller = HomeRepoController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigationController.topViewController?.present(alert, animated: true, completion: nil)
    }
}

// MARK: - HomeRepoNavigationProtocol
extension HomeRepoCoordinator: HomeRepoNavigationProtocol {
    func shouldError(message: String) {
        showMessage(withTitle: "Error", message: message)
    }
    
    func shouldDetailsRepo(repository: RepositoryModel) {
        let coordinator = DetailsRepoCoordinator(navigationController)
        coordinator.sceneDetailsRepo(repository: repository)
    }
}
