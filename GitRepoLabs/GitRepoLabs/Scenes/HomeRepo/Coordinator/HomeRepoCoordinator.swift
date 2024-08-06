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
}

// MARK: - HomeRepoNavigationProtocol
extension HomeRepoCoordinator: HomeRepoNavigationProtocol {
    func shouldDetailsRepo(repository: RepositoryModel) {
        let coordinator = DetailsRepoCoordinator(navigationController)
        coordinator.sceneDetailsRepo(repository: repository)
    }
}
