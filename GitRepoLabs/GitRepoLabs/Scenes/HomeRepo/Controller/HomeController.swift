//
//  HomeController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class HomeRepoController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: HomeRepoViewModelProtocol
    
    // MARK: - LifeCycle
    
    init(viewModel: HomeRepoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - CodeView
extension HomeRepoController: CodeView {
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBlue
    }
}
