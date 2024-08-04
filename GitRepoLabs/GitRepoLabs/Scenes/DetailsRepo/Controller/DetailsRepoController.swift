//
//  DetailsRepoController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class DetailsRepoController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: DetailsRepoViewModelProtocol
    
    // MARK: - LifeCycle
    
    init(viewModel: DetailsRepoViewModelProtocol) {
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
extension DetailsRepoController: CodeView {
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func setupAdditionalConfiguration() {
    }
}
