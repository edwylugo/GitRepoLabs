//
//  HomeController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class HomeRepoController: UIViewController {
    
    // MARK: - Properties
    private let listRepoTableView = UITableView(translateMask: false).apply {
        $0.separatorStyle = .singleLine
        $0.backgroundColor = .clear
        $0.allowsSelection = true
        $0.bounces = true
        $0.isUserInteractionEnabled = true
    }
    
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
        view.addSubview(listRepoTableView)
    }
    
    func setupConstraints() {
        listRepoTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 leading: view.leadingAnchor,
                                 bottom: view.bottomAnchor,
                                 trailing: view.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}
