//
//  DetailsRepoCoordinator.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

protocol DetailsRepoCoordinatorProtocol: Coordinator {
    func sceneDetailsRepo()
}

class DetailsRepoCoordinator: DetailsRepoCoordinatorProtocol {

    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .detailsRepo }
    
    func start() {
        sceneDetailsRepo()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func sceneDetailsRepo() {
        let viewModel = DetailsRepoViewModel(navigationDelegate: self)
        let controller = DetailsRepoController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - DetailsRepoNavigationProtocol
extension DetailsRepoCoordinator: DetailsRepoNavigationProtocol {
    
}
